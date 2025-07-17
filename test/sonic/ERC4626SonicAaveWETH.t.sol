// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAaveWETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 13405152;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave WS
        erc4626State.wrapper = IERC4626(0xeB5e9B0ae5bb60274786C747A1A2A798c11271E0);
        // Donor of WS
        erc4626State.underlyingDonor = 0xe18Ab82c81E7Eecff32B8A82B1b7d2d23F1EcE96;
        erc4626State.amountToDonate = 1e3 * 1e18;
    }
}
