// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadAaveCbBTCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 89235053;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave Monad cbBTC
        erc4626State.wrapper = IERC4626(0xd46d988C0055eff66eEaad582E985d3805aD6d2b);
        // Donor of cbBTC (largest cbBTC holder on Monad, a contract holding ~32.27 cbBTC at the pinned block)
        erc4626State.underlyingDonor = 0xD5D960E8C380B724a48AC59E2DfF1b2CB4a1eAee;
        erc4626State.amountToDonate = 10e8;
    }
}
