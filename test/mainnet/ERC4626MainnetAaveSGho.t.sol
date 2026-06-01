// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaveSghoTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 25122173;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // sGHO
        erc4626State.wrapper = IERC4626(0xE1753F2e00940cC31213dd92013cF019DFE4ca1d);
        // Donor of GHO tokens
        erc4626State.underlyingDonor = 0xA563319BF55fDAbC304A5c1450D4fBa0bcA9776E;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
