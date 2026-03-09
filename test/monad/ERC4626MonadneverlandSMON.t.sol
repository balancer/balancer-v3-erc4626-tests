// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandSMONTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 58687139;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland SMON
        erc4626State.wrapper = IERC4626(0x08139339dd9A480CEB84D9C7CcE48BE436dB20b3);
        // Donor of SMON
        erc4626State.underlyingDonor = 0x32BAe06Ec52B5f59BC3c5eC8C3d8C666c600b388;
        
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
