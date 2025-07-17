// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAvalonSolvBTCbbnTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 4820900;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Avalon solvBTC.bbn
        erc4626State.wrapper = IERC4626(0xA28d4dbcC90C849e3249D642f356D85296a12954);
        // Donor of solvBTC.bbn
        erc4626State.underlyingDonor = 0xe3a97c4Cc6725B96fb133c636D2e88Cc3d6CfdBE;
        erc4626State.amountToDonate = 1 * 1e16;
    }
}
