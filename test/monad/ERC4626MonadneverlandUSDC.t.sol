// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 55175610;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland USDC
        erc4626State.wrapper = IERC4626(0x8d5c2Df3Eef09088Fcccf3376D8EcD0Dd505f642);
        // Donor of USDC
        erc4626State.underlyingDonor = 0x464Aec9Fa2a78F3312bb155e82f7D1b063A336BE;
        
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
