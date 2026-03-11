// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetsUSDsTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 24636567;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // sUSDS
        erc4626State.wrapper = IERC4626(0xa3931d71877C0E7a3148CB7Eb4463524FEc27fbD);
        // Donor of USDS tokens
        erc4626State.underlyingDonor = 0xA632D59b9B804a956BfaA9b48Af3A1b74808FC1f;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
