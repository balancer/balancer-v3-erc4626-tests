// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoSteakhouseUsdqTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 21735567;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Morpho's Steakhouse USDQ
        erc4626State.wrapper = IERC4626(0xA1b60d96e5C50dA627095B9381dc5a46AF1a9a42);
        // Donor of USDQ tokens
        erc4626State.underlyingDonor = 0xCED0E43EEebF37e49Faaf064640b1FB228d18a12;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
