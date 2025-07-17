// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicStabilityUsdcTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 33536213;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Stability USDC
        erc4626State.wrapper = IERC4626(0xEEEEEEE6d95E55A468D32FeB5d6648754d10A967);
        // Donor of USDC.e
        erc4626State.underlyingDonor = 0x578Ee1ca3a8E1b54554Da1Bf7C583506C4CD11c6;
        erc4626State.amountToDonate = 1e7 * 1e6;
    }
}
