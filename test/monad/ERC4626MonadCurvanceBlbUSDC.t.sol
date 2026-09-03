// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadCurvanceBlbUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 101600000;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // blbUSDC
        erc4626State.wrapper = IERC4626(0x215394B5677Cb7a18B6fA8cc2cD155C024ee6b2E);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0x464Aec9Fa2a78F3312bb155e82f7D1b063A336BE;
        erc4626State.amountToDonate = 5e3 * 1e6;
        // Unwinding from the underlying Curvance market rounds down by a wei, which the vault rejects as a loss on
        // very small amounts. 0.1 USDC clears that floor.
        erc4626State.minDeposit = 1e5;
    }
}
