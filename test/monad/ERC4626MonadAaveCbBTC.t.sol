// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

// KNOWN FAILING — for SC team review, do not merge as-is.
//
// waMoncbBTC (Aave Monad cbBTC, 8 decimals). The donor below is the largest cbBTC EOA on Monad and
// passes the `balanceOf(donor) >= 3 * amountToDonate` gate at the pinned block. The suite still fails
// `testAddAndRemoveLiquidityFromBuffer__Fork__Fuzz` with `StdUtils bound: Max is less than min`.
//
// Root cause: _initializeWallet gives the lp `amountToDonate / 2`, and that test bounds
// initialize amounts to [_BUFFER_MINIMUM_TOTAL_SUPPLY, balanceOf(lp) / initToAddFactor] with
// _BUFFER_MINIMUM_TOTAL_SUPPLY = 1e6 and initToAddFactor = 1000 → needs lp >= 1e9 units, i.e.
// amountToDonate >= 2e9 base units = 20 cbBTC, requiring a >= 60 cbBTC EOA donor. The largest cbBTC
// EOA on Monad holds ~1.176; the largest holder overall (Morpho, a contract) holds ~32. There is not
// enough cbBTC EOA liquidity on Monad today to satisfy the buffer test's minimum sizing.
contract ERC4626MonadAaveCbBTCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 89235053;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave Monad cbBTC
        erc4626State.wrapper = IERC4626(0xd46d988C0055eff66eEaad582E985d3805aD6d2b);
        // Donor of cbBTC (largest cbBTC EOA on Monad, ~1.176 cbBTC at the pinned block)
        erc4626State.underlyingDonor = 0xEf759E3f7FE04AC8C5b63736E5196dEd52EAF34e;
        erc4626State.amountToDonate = 3e7;
    }
}
