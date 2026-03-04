// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoSteakhouseWUSDLTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 21537026;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Morpho's Steakhouse wUSDL
        erc4626State.wrapper = IERC4626(0xbEeFc011e94f43b8B7b455eBaB290C7Ab4E216f1);
        // Donor of wUSDL tokens
        erc4626State.underlyingDonor = 0xBBBBBbbBBb9cC5e90e3b3Af64bdAF62C37EEFFCb;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
