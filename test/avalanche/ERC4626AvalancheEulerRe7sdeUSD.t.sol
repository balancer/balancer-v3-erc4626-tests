// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheEulerRe7sdeUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 68855724;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Eurler USDC
        erc4626State.wrapper = IERC4626(0xFECebF56f150A68dDd197c3a6101da35C46693Ac);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0xb9CC370a8f19322FC4BF69Da80c6C39FF8F2dB90;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
