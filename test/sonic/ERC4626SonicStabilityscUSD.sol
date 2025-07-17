// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicStabilityscUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 33536213;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Stability scUSD
        erc4626State.wrapper = IERC4626(0xccccCCcca9FC69a2b32408730011EdB3205A93A1);
        // Donor of scUSD
        erc4626State.underlyingDonor = 0xe6605932e4a686534D19005BB9dB0FBA1F101272;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
