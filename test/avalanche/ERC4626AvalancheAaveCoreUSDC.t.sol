// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveCoreUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // waCoreUSDC
        erc4626State.wrapper = IERC4626(0x01D7f7B7CE2123192fECC20bd1caF3e4d9e4C10D);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0x0393c6615a078e7697f5904FB8ca73F759355E93;
        erc4626State.amountToDonate = 1e5 * 1e6;
    }
}
