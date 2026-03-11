// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandSHMONTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 58687139;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland SHMON
        erc4626State.wrapper = IERC4626(0x5e073494678fB7FA4a05bB17d45941Dd9Dc469c1);
        // Donor of SHMON
        erc4626State.underlyingDonor = 0x45e5bdB64AF009A5792b650BF5bd110665500Da3;
        
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
