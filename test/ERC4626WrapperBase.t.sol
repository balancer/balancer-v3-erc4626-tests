// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { IPermit2 } from "permit2/src/interfaces/IPermit2.sol";

import { IBufferRouter } from "@balancer-v3-monorepo/interfaces/vault/IBufferRouter.sol";
import { IVault } from "@balancer-v3-monorepo/interfaces/vault/IVault.sol";

struct ForkState {
    string network;
    uint256 blockNumber;
}

/**
 * @notice Defines wrapper, underlyingDonor, amountToDonate and other test variables.
 * @param wrapper The address of the ERC4626 token
 * @param underlyingToken The address of the underlying token
 * @param underlyingDonor The address that will donate the underlying tokens
 * @param amountToDonate The amount of underlying tokens to donate
 * @param minDeposit Some ERC4626 protocols require a minimum amount of underlying tokens to deposit
 * @param underlyingToWrappedFactor Some ERC4626 protocols use a different amount of decimals between underlying and
 * the wrapper. This factor scales underlying decimals to wrapper decimals
 */
struct ERC4626SetupState {
    IERC4626 wrapper;
    IERC20 underlyingToken;
    address underlyingDonor;
    uint256 amountToDonate;
    uint256 minDeposit;
    uint256 underlyingToWrappedFactor;
}

/**
 * @notice Base test for ERC4626 wrappers.
 * @dev This test is designed to be used with a fork of the network. To implement these tests, just inherit this
 * contract and implement the _setupFork and _setUpForkTestVariables functions.
 */
abstract contract ERC4626WrapperBaseTest is Test {
    using SafeERC20 for IERC20;

    uint128 internal constant _MAX_UINT128 = type(uint128).max;
    uint256 internal constant _BUFFER_MINIMUM_TOTAL_SUPPLY = 1e6;

    IBufferRouter internal bufferRouter;
    IVault internal vault;
    IPermit2 internal permit2;

    ERC4626SetupState internal $;
    uint256 private userInitialUnderlying;
    uint256 private userInitialShares;

    address internal alice;
    address internal lp;
    address internal user;

    // Tolerance between convert/preview and the actual operation.
    uint256 internal constant TOLERANCE = 2;

    function setUp() public virtual {
        ForkState memory forkState = _setupFork();

        forkState = _configurePermit2AndBufferToNetwork(forkState);

        vm.createSelectFork({ blockNumber: forkState.blockNumber, urlOrAlias: forkState.network });

        _setupERC4626State();

        (user, ) = makeAddrAndKey("User");
        vm.label(user, "User");
        _initializeWallet(user);

        userInitialUnderlying = $.underlyingToken.balanceOf(user);
        userInitialShares = $.wrapper.balanceOf(user);

        (lp, ) = makeAddrAndKey("lp");
        vm.label(lp, "lp");
        _initializeWallet(lp);
        _setupAllowance(lp);

        (alice, ) = makeAddrAndKey("Alice");
        vm.label(alice, "Alice");
        _initializeWallet(alice);
        _setupAllowance(alice);

        uint256 shares = vault.getBufferTotalShares($.wrapper);
        if (shares > 0) {
            revert("Vault's buffer is already initialized. Check Readme.md, chapter `Debug failing tests`.");
        }
    }

    function _setupERC4626State() private {
        $ = _setUpForkTestVariables();

        $.underlyingToken = IERC20($.wrapper.asset());

        vm.label(address($.wrapper), "wrapper");
        vm.label(address($.underlyingToken), "underlying");

        if ($.underlyingToken.balanceOf($.underlyingDonor) < 3 * $.amountToDonate) {
            revert("Underlying donor does not have enough liquidity. Check Readme.md, chapter `Debug failing tests`.");
        }

        // If minDeposit and underlyingToWrappedFactor were not set by `_setUpForkTestVariables`, we set default
        // values.
        $.minDeposit = $.minDeposit == 0 ? 100 : $.minDeposit;
        $.underlyingToWrappedFactor = $.underlyingToWrappedFactor == 0
            ? 10 ** ($.wrapper.decimals() - IERC20Metadata(address($.underlyingToken)).decimals())
            : $.underlyingToWrappedFactor;
    }

    /**
     * @notice Defines network and blockNumber.
     * @dev The test assigns a default block number if no block number is given. Make sure the the buffer was not been
     * initialized for the ERC4626 token in the current block number.
     * @return forkState The network and block number to fork.
     */
    function _setupFork() internal pure virtual returns (ForkState memory);

    /**
     * @notice Defines wrapper, underlyingDonor, amountToDonate and other test variables.
     * @dev Make sure the underlyingDonor has at least 3 times the amountToDonate amount in underlying tokens. If
     * `minDeposit` is 0, the test will assume the value 100.
     *
     * @return erc4626State The wrapper, underlyingDonor, amountToDonate and other test variables.
     */
    function _setUpForkTestVariables() internal virtual returns (ERC4626SetupState memory erc4626State);

    function testPreConditions() public view {
        assertEq(userInitialUnderlying, $.amountToDonate / 2, "User balance of underlying is wrong.");
        assertEq(userInitialShares, $.wrapper.balanceOf(user), "User balance of shares is wrong.");
    }

    function testTokenParameters() public view {
        assertLe(IERC20Metadata($.wrapper.asset()).decimals(), 18, "Underlying has more than 18 decimals.");
        assertLe($.wrapper.decimals(), 18, "Wrapper has more than 18 decimals.");
    }

    function testDeposit__Fork__Fuzz(uint256 amountToDeposit) public {
        amountToDeposit = bound(amountToDeposit, $.minDeposit, userInitialUnderlying);

        uint256 convertedShares = $.wrapper.convertToShares(amountToDeposit);
        uint256 previewedShares = $.wrapper.previewDeposit(amountToDeposit);

        uint256 balanceUnderlyingBefore = $.underlyingToken.balanceOf(user);
        uint256 balanceSharesBefore = $.wrapper.balanceOf(user);

        vm.startPrank(user);
        $.underlyingToken.forceApprove(address($.wrapper), amountToDeposit);
        uint256 mintedShares = $.wrapper.deposit(amountToDeposit, user);
        vm.stopPrank();

        uint256 balanceUnderlyingAfter = $.underlyingToken.balanceOf(user);
        uint256 balanceSharesAfter = $.wrapper.balanceOf(user);

        assertEq(balanceUnderlyingAfter, balanceUnderlyingBefore - amountToDeposit, "Deposit is not EXACT_IN");
        assertEq(balanceSharesAfter, balanceSharesBefore + mintedShares, "Deposit minted shares do not match");
        assertApproxEqAbs(
            convertedShares,
            mintedShares,
            TOLERANCE,
            "Convert and actual operation difference is higher than tolerance"
        );
        assertApproxEqAbs(
            previewedShares,
            mintedShares,
            TOLERANCE,
            "Preview and actual operation difference is higher than tolerance"
        );

        // Mint _at least_ previewed shares.
        assertGe(mintedShares, previewedShares, "Minted shares is lower than converted minted");
    }

    function testMint__Fork__Fuzz(uint256 amountToMint) public {
        // When user mints, a round up may occur and add some wei in the amount of underlying required to deposit.
        // This can cause the user to not have enough tokens to deposit.
        // So, the maximum amountToMint must be the initialShares (which is exactly the initialUnderlying, converted to
        // shares) less a tolerance.
        amountToMint = bound(
            amountToMint,
            $.minDeposit * $.underlyingToWrappedFactor,
            userInitialShares - (TOLERANCE * $.underlyingToWrappedFactor)
        );

        uint256 convertedUnderlying = $.wrapper.convertToAssets(amountToMint);
        uint256 previewedUnderlying = $.wrapper.previewMint(amountToMint);

        uint256 balanceUnderlyingBefore = $.underlyingToken.balanceOf(user);
        uint256 balanceSharesBefore = $.wrapper.balanceOf(user);

        vm.startPrank(user);
        $.underlyingToken.forceApprove(address($.wrapper), previewedUnderlying);
        uint256 depositedUnderlying = $.wrapper.mint(amountToMint, user);
        vm.stopPrank();

        uint256 balanceUnderlyingAfter = $.underlyingToken.balanceOf(user);
        uint256 balanceSharesAfter = $.wrapper.balanceOf(user);

        assertEq(balanceUnderlyingAfter, balanceUnderlyingBefore - depositedUnderlying, "Mint assets do not match");
        assertEq(balanceSharesAfter, balanceSharesBefore + amountToMint, "Mint is not EXACT_OUT");
        assertApproxEqAbs(
            convertedUnderlying,
            depositedUnderlying,
            TOLERANCE,
            "Convert and actual operation difference is higher than tolerance"
        );
        assertApproxEqAbs(
            previewedUnderlying,
            depositedUnderlying,
            TOLERANCE,
            "Preview and actual operation difference is higher than tolerance"
        );

        // Deposit _at most_ `previewedUnderlying`.
        assertGe(previewedUnderlying, depositedUnderlying, "Previewed underlying is lower than converted deposited");
    }

    function testWithdraw__Fork__Fuzz(uint256 amountToWithdraw) public {
        // When user deposited to underlying, a round down may occur and remove some wei. So, makes sure
        // amountToWithdraw does not pass the amount deposited - a wei tolerance.
        amountToWithdraw = bound(amountToWithdraw, $.minDeposit, userInitialUnderlying - TOLERANCE);

        uint256 convertedShares = $.wrapper.convertToShares(amountToWithdraw);
        uint256 previewedShares = $.wrapper.previewWithdraw(amountToWithdraw);

        uint256 balanceUnderlyingBefore = $.underlyingToken.balanceOf(user);
        uint256 balanceSharesBefore = $.wrapper.balanceOf(user);

        vm.prank(user);
        uint256 burnedShares = $.wrapper.withdraw(amountToWithdraw, user, user);

        uint256 balanceUnderlyingAfter = $.underlyingToken.balanceOf(user);
        uint256 balanceSharesAfter = $.wrapper.balanceOf(user);

        assertEq(balanceUnderlyingAfter, balanceUnderlyingBefore + amountToWithdraw, "Withdraw is not EXACT_OUT");
        assertEq(balanceSharesAfter, balanceSharesBefore - burnedShares, "Withdraw burned shares do not match");
        assertApproxEqAbs(
            convertedShares,
            burnedShares,
            TOLERANCE,
            "Convert and actual operation difference is higher than tolerance"
        );
        assertApproxEqAbs(
            previewedShares,
            burnedShares,
            TOLERANCE,
            "Preview and actual operation difference is higher than tolerance"
        );

        // Burn _at most_ previewed shares.
        assertGe(previewedShares, burnedShares, "Previewed shares is lower than converted burned");
    }

    function testRedeem__Fork__Fuzz(uint256 amountToRedeem) public {
        // When user deposited to underlying, a round down may occur and remove some wei. So, makes sure
        // amountToWithdraw does not pass the amount deposited - a wei tolerance.
        amountToRedeem = bound(
            amountToRedeem,
            $.minDeposit * $.underlyingToWrappedFactor,
            userInitialShares - TOLERANCE
        );

        uint256 convertedAssets = $.wrapper.convertToAssets(amountToRedeem);
        uint256 previewedAssets = $.wrapper.previewRedeem(amountToRedeem);

        uint256 balanceUnderlyingBefore = $.underlyingToken.balanceOf(user);
        uint256 balanceSharesBefore = $.wrapper.balanceOf(user);

        vm.startPrank(user);
        uint256 withdrawnAssets = $.wrapper.redeem(amountToRedeem, user, user);
        vm.stopPrank();

        uint256 balanceUnderlyingAfter = $.underlyingToken.balanceOf(user);
        uint256 balanceSharesAfter = $.wrapper.balanceOf(user);

        assertEq(balanceUnderlyingAfter, balanceUnderlyingBefore + withdrawnAssets, "Redeem is not EXACT_IN");
        assertEq(balanceSharesAfter, balanceSharesBefore - amountToRedeem, "Redeem burned shares do not match");
        assertApproxEqAbs(
            convertedAssets,
            withdrawnAssets,
            TOLERANCE,
            "Convert and actual operation difference is higher than tolerance"
        );
        assertApproxEqAbs(
            previewedAssets,
            withdrawnAssets,
            TOLERANCE,
            "Preview and actual operation difference is higher than tolerance"
        );

        // Withdraw _at least_ `previewedAssets`.
        assertGe(withdrawnAssets, previewedAssets, "Previewed assets is lower than converted withdrawn");
    }

    function testAddLiquidityToBuffer__Fork__Fuzz(
        uint256 underlyingToInitialize,
        uint256 wrappedToInitialize,
        uint256 sharesToIssue
    ) public {
        underlyingToInitialize = bound(
            underlyingToInitialize,
            _BUFFER_MINIMUM_TOTAL_SUPPLY,
            $.underlyingToken.balanceOf(lp) / 10
        );
        wrappedToInitialize = bound(wrappedToInitialize, _BUFFER_MINIMUM_TOTAL_SUPPLY, $.wrapper.balanceOf(lp) / 10);
        sharesToIssue = bound(sharesToIssue, _BUFFER_MINIMUM_TOTAL_SUPPLY, $.underlyingToken.balanceOf(lp) / 2);

        vm.prank(lp);
        bufferRouter.initializeBuffer($.wrapper, underlyingToInitialize, wrappedToInitialize, 0);
        // Since the buffer burns part of the shares, we measure the total shares in the vault instead of using the
        // value returned by initializeBuffer;
        uint256 totalShares = vault.getBufferTotalShares($.wrapper);

        vm.prank(lp);
        (uint256 underlyingDeposited, uint256 wrappedDeposited) = bufferRouter.addLiquidityToBuffer(
            $.wrapper,
            _MAX_UINT128,
            _MAX_UINT128,
            sharesToIssue
        );

        // Measures if the underlying and wrapped deposited on addLiquidityToBuffer are worth the same number of shares
        // than in initialized liquidity (or less).
        assertGe(
            underlyingDeposited,
            (sharesToIssue * underlyingToInitialize) / totalShares,
            "User spent less underlying tokens than it should"
        );
        assertGe(
            wrappedDeposited,
            (sharesToIssue * wrappedToInitialize) / totalShares,
            "User spent less wrapped tokens than it should"
        );
    }

    function testRemoveLiquidityFromBuffer__Fork__Fuzz(
        uint256 underlyingToInitialize,
        uint256 wrappedToInitialize,
        uint256 sharesToRemove
    ) public {
        underlyingToInitialize = bound(
            underlyingToInitialize,
            _BUFFER_MINIMUM_TOTAL_SUPPLY,
            $.underlyingToken.balanceOf(lp) / 10
        );
        wrappedToInitialize = bound(wrappedToInitialize, _BUFFER_MINIMUM_TOTAL_SUPPLY, $.wrapper.balanceOf(lp) / 10);

        vm.prank(lp);
        uint256 lpShares = bufferRouter.initializeBuffer($.wrapper, underlyingToInitialize, wrappedToInitialize, 0);
        // Since the buffer burns part of the shares, we measure the total shares in the vault instead of using the
        // value returned by initializeBuffer;
        uint256 totalShares = vault.getBufferTotalShares($.wrapper);

        sharesToRemove = bound(sharesToRemove, 0, lpShares);

        vm.prank(lp);
        (uint256 underlyingRemoved, uint256 wrappedRemoved) = vault.removeLiquidityFromBuffer(
            $.wrapper,
            sharesToRemove,
            0,
            0
        );

        // Measures if the underlying and wrapped received from `removeLiquidityFromBuffer` are worth the same number
        // of shares than in initialized liquidity (or less).
        assertLe(
            underlyingRemoved,
            (sharesToRemove * underlyingToInitialize) / totalShares,
            "User received more underlying tokens than it should"
        );
        assertLe(
            wrappedRemoved,
            (sharesToRemove * wrappedToInitialize) / totalShares,
            "User received more wrapped tokens than it should"
        );
    }

    function testAddAndRemoveLiquidityFromBuffer__Fork__Fuzz(
        uint256 underlyingToInitialize,
        uint256 wrappedToInitialize,
        uint256 sharesToIssueAndRemove
    ) public {
        uint256 initToAddFactor = 1000;
        underlyingToInitialize = bound(
            underlyingToInitialize,
            _BUFFER_MINIMUM_TOTAL_SUPPLY,
            $.underlyingToken.balanceOf(lp) / initToAddFactor
        );
        wrappedToInitialize = bound(
            wrappedToInitialize,
            _BUFFER_MINIMUM_TOTAL_SUPPLY,
            $.wrapper.balanceOf(lp) / initToAddFactor
        );

        vm.prank(lp);
        uint256 initShares = bufferRouter.initializeBuffer($.wrapper, underlyingToInitialize, wrappedToInitialize, 0);

        sharesToIssueAndRemove = bound(sharesToIssueAndRemove, 0, initShares * initToAddFactor);

        vm.prank(alice);
        (uint256 underlyingDeposited, uint256 wrappedDeposited) = bufferRouter.addLiquidityToBuffer(
            $.wrapper,
            _MAX_UINT128,
            _MAX_UINT128,
            sharesToIssueAndRemove
        );

        vm.prank(alice);
        (uint256 underlyingRemoved, uint256 wrappedRemoved) = vault.removeLiquidityFromBuffer(
            $.wrapper,
            sharesToIssueAndRemove,
            0,
            0
        );

        assertLe(underlyingRemoved, underlyingDeposited, "User received more than they added");
        assertLe(wrappedRemoved, wrappedDeposited, "User received more than they added");
    }

    function testPreviewDepositRounding__Fork__Fuzz(uint256 amount) public view {
        amount = bound(amount, 1, 100_000_000e18);
        uint256 previewRoundDown = $.wrapper.previewDeposit(amount - 1);
        vm.assume(previewRoundDown > 0);
        previewRoundDown -= 1;
        uint256 preview = $.wrapper.previewDeposit(amount);
        assertLe(previewRoundDown, preview, "Preview round down does not match expectations");
    }

    function testPreviewMintRounding__Fork__Fuzz(uint256 amount) public view {
        amount = bound(amount, 0, 100_000_000e18);
        uint256 previewRoundUp = $.wrapper.previewMint(amount + 1) + 1;
        uint256 preview = $.wrapper.previewMint(amount);
        assertGe(previewRoundUp, preview, "Preview round up does not match expectations");
    }

    function testPreviewRedeemRounding__Fork__Fuzz(uint256 amount) public view {
        amount = bound(amount, 1, 100_000_000e18);
        uint256 previewRoundDown = $.wrapper.previewRedeem(amount - 1);
        vm.assume(previewRoundDown > 0);
        previewRoundDown -= 1;
        uint256 preview = $.wrapper.previewRedeem(amount);
        assertLe(previewRoundDown, preview, "Preview round down does not match expectations");
    }

    function testPreviewWithdrawRounding__Fork__Fuzz(uint256 amount) public view {
        amount = bound(amount, 0, 100_000_000e18);
        uint256 previewRoundUp = $.wrapper.previewWithdraw(amount + 1) + 1;
        uint256 preview = $.wrapper.previewWithdraw(amount);
        assertGe(previewRoundUp, preview, "Preview round up does not match expectations");
    }

    function _initializeWallet(address receiver) private {
        uint256 initialDeposit = $.amountToDonate / 2;

        vm.prank($.underlyingDonor);
        $.underlyingToken.safeTransfer(receiver, $.amountToDonate);

        vm.startPrank(receiver);
        $.underlyingToken.forceApprove(address($.wrapper), initialDeposit);
        $.wrapper.deposit(initialDeposit, receiver);
        vm.stopPrank();
    }

    function _setupAllowance(address sender) private {
        vm.startPrank(sender);
        $.underlyingToken.forceApprove(address(permit2), type(uint256).max);
        $.wrapper.approve(address(permit2), type(uint256).max);

        permit2.approve(address($.underlyingToken), address(bufferRouter), type(uint160).max, type(uint48).max);
        permit2.approve(address($.wrapper), address(bufferRouter), type(uint160).max, type(uint48).max);
        vm.stopPrank();
    }

    function _configurePermit2AndBufferToNetwork(ForkState memory forkState) private returns (ForkState memory) {
        // Block Numbers are based on the deployment of BufferRouter.
        // IMPORTANT: If a test requires a new blockNumber, change `overrideBlockNumber` in the test itself using the
        // function `setUpForkTestVariables()`. Do not change the values below, since all tests depend on it.

        if (_compareStrings(forkState.network, "mainnet")) {
            forkState.blockNumber = forkState.blockNumber != 0 ? forkState.blockNumber : 21339384;
            permit2 = IPermit2(0x000000000022D473030F116dDEE9F6B43aC78BA3);
            bufferRouter = IBufferRouter(0x9179C06629ef7f17Cb5759F501D89997FE0E7b45);
            vault = IVault(0xbA1333333333a1BA1108E8412f11850A5C319bA9);
        } else if (_compareStrings(forkState.network, "gnosis")) {
            forkState.blockNumber = forkState.blockNumber != 0 ? forkState.blockNumber : 37377481;
            permit2 = IPermit2(0x000000000022D473030F116dDEE9F6B43aC78BA3);
            bufferRouter = IBufferRouter(0x86e67E115f96DF37239E0479441303De0de7bc2b);
            vault = IVault(0xbA1333333333a1BA1108E8412f11850A5C319bA9);
        } else if (_compareStrings(forkState.network, "sepolia")) {
            forkState.blockNumber = forkState.blockNumber != 0 ? forkState.blockNumber : 7219291;
            permit2 = IPermit2(0x000000000022D473030F116dDEE9F6B43aC78BA3);
            bufferRouter = IBufferRouter(0xb5F3A41515457CC6E2716c62a011D260441CcfC9);
            vault = IVault(0xbA1333333333a1BA1108E8412f11850A5C319bA9);
        } else if (_compareStrings(forkState.network, "sonic")) {
            forkState.blockNumber = forkState.blockNumber != 0 ? forkState.blockNumber : 3842500;
            permit2 = IPermit2(0x000000000022D473030F116dDEE9F6B43aC78BA3);
            bufferRouter = IBufferRouter(0x532dA919D3EB5606b5867A6f505969c57F3A721b);
            vault = IVault(0xbA1333333333a1BA1108E8412f11850A5C319bA9);
        } else if (_compareStrings(forkState.network, "base")) {
            forkState.blockNumber = forkState.blockNumber != 0 ? forkState.blockNumber : 25458827;
            permit2 = IPermit2(0x000000000022D473030F116dDEE9F6B43aC78BA3);
            bufferRouter = IBufferRouter(0x4132f7AcC9dB7A6cF7BE2Dd3A9DC8b30C7E6E6c8);
            vault = IVault(0xbA1333333333a1BA1108E8412f11850A5C319bA9);
        } else if (_compareStrings(forkState.network, "arbitrum")) {
            forkState.blockNumber = forkState.blockNumber != 0 ? forkState.blockNumber : 300880872;
            permit2 = IPermit2(0x000000000022D473030F116dDEE9F6B43aC78BA3);
            bufferRouter = IBufferRouter(0x311334883921Fb1b813826E585dF1C2be4358615);
            vault = IVault(0xbA1333333333a1BA1108E8412f11850A5C319bA9);
        } else if (_compareStrings(forkState.network, "avalanche")) {
            forkState.blockNumber = forkState.blockNumber != 0 ? forkState.blockNumber : 59388800;
            permit2 = IPermit2(0x000000000022D473030F116dDEE9F6B43aC78BA3);
            bufferRouter = IBufferRouter(0x6817149cb753BF529565B4D023d7507eD2ff4Bc0);
            vault = IVault(0xba1333333333cbcdB5D83c2e5d1D898E07eD00Dc);
        } else if (_compareStrings(forkState.network, "optimism")) {
            forkState.blockNumber = forkState.blockNumber != 0 ? forkState.blockNumber : 133970000;
            permit2 = IPermit2(0x000000000022D473030F116dDEE9F6B43aC78BA3);
            bufferRouter = IBufferRouter(0x311334883921Fb1b813826E585dF1C2be4358615);
            vault = IVault(0xbA1333333333a1BA1108E8412f11850A5C319bA9);
        } else if (_compareStrings(forkState.network, "hyperevm")) {
            forkState.blockNumber = forkState.blockNumber != 0 ? forkState.blockNumber : 8062650;
            permit2 = IPermit2(0x000000000022D473030F116dDEE9F6B43aC78BA3);
            bufferRouter = IBufferRouter(0x9805dcfD25e6De36bad8fe9D3Fe2c9b44B764102);
            vault = IVault(0xbA1333333333a1BA1108E8412f11850A5C319bA9);
        } else {
            revert("Network not registered in ERC4626WrapperBase.sol");
        }

        return forkState;
    }

    function _compareStrings(string memory a, string memory b) private pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }
}
