// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseWrappedExtraFiXBaseUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
        forkState.blockNumber = 30905678;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Wrapped ExtraFi X Base USDC
        erc4626State.wrapper = IERC4626(0x589A7339C6d0c8777E7429F57f2f95c069c37288);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0xee81B5Afc73Cf528778E0ED98622e434E5eFADb4;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
