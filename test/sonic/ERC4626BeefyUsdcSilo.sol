// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BeefyUsdcSilo is ERC4626WrapperBaseTest {
    using SafeERC20 for IERC20;

    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 5046915;

        // Beefy USDC to Silo
        wrapper = IERC4626(0x7870ddFd5ACA4E977B2287e9A212bcbe8FC4135a);
        // Donor of USDC.e
        underlyingDonor = 0x4E216C15697C1392fE59e1014B009505E05810Df;
        amountToDonate = 1e6 * 1e6;
    }

    // Note: Beefy USDC Silo is not fully compliant with ERC4626, and sometimes the mint operation returns a different
    // amount of shares to the receiver than the numeric output of the function.
    function testMint__Fork__Fuzz(uint256 amountToMint) public override {
        // When user mints, a round up may occur and add some wei in the amount of underlying required to deposit.
        // This can cause the user to not have enough tokens to deposit.
        // So, the maximum amountToMint must be the initialShares (which is exactly the initialUnderlying, converted to
        // shares) less a tolerance.
        amountToMint = bound(
            amountToMint,
            MIN_DEPOSIT * underlyingToWrappedFactor,
            userInitialShares - (TOLERANCE * underlyingToWrappedFactor)
        );

        uint256 convertedUnderlying = wrapper.convertToAssets(amountToMint);
        uint256 previewedUnderlying = wrapper.previewMint(amountToMint);

        uint256 balanceUnderlyingBefore = underlyingToken.balanceOf(user);
        uint256 balanceSharesBefore = wrapper.balanceOf(user);

        vm.startPrank(user);
        underlyingToken.forceApprove(address(wrapper), previewedUnderlying);
        uint256 depositedUnderlying = wrapper.mint(amountToMint, user);
        vm.stopPrank();

        uint256 balanceUnderlyingAfter = underlyingToken.balanceOf(user);
        uint256 balanceSharesAfter = wrapper.balanceOf(user);

        assertEq(balanceUnderlyingAfter, balanceUnderlyingBefore - depositedUnderlying, "Mint is not EXACT_OUT");
        assertApproxEqAbs(
            balanceSharesAfter,
            balanceSharesBefore + amountToMint,
            TOLERANCE,
            "Mint shares do not match"
        );
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
    }
}
