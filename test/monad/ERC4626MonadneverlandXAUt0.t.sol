// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandXAUt0Test is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 97149203;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland XAUt0
        erc4626State.wrapper = IERC4626(0x22139A346b6312EB0A9812C67CfCe4A694676d59);
        // Donor of XAUt0 tokens
        erc4626State.underlyingDonor = 0xf89d7b9c864f589bbF53a82105107622B35EaA40;
        // The Neverland XAUt0 market has supplyCap = 30 with ~19.25 already supplied (~10.75 headroom), so this
        // is the largest donate that fits: setUp deposits 1.5x and the deposit/mint fuzz peaks at another 0.5x.
        // 3 tests still fail: testAddAndRemoveLiquidityFromBuffer needs amountToDonate >= 2000x the Vault's
        // buffer minimum (2e7 here) because of the hard-coded initToAddFactor = 1000, and testDeposit/testMint
        // fuzz above the market's remaining supply cap (they don't bound by maxDeposit). With initToAddFactor
        // = 100 this exact config passes all 17 tests.
        erc4626State.amountToDonate = 5e6;
    }
}
