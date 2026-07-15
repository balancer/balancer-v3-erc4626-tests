// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveCoreEURCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 90408149;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // waCoreEURC
        erc4626State.wrapper = IERC4626(0x7b538a1840EAf2Ed92EEB67eE744AE627335e201);
        // Donor of EURC tokens
        erc4626State.underlyingDonor = 0xBF14DB80D9275FB721383a77C00Ae180fc40ae98;
        erc4626State.amountToDonate = 1e5 * 1e6;
    }
}
