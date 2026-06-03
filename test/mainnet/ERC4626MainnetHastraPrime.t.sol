// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetHastraPrimeTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 25238060;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // PRIME
        erc4626State.wrapper = IERC4626(0x19ebb35279A16207Ec4ba82799CC64715065F7F6);
        // Donor of wYLDS tokens
        erc4626State.underlyingDonor = 0x82E5871654b7635A5e3e8B9DDae019Dd3732e866;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
