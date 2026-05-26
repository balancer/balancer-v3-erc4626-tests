// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetsUSGTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 25179602;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // sUSG
        erc4626State.wrapper = IERC4626(0xF17D6f98A5C6EAA99d149079984119e0A4EF6900);
        // Donor of USG tokens
        erc4626State.underlyingDonor = 0xF89615F75c8161dc185C03020240905f6b66bAd9;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
