// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadAaveUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 85383178;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave Monad USDC
        erc4626State.wrapper = IERC4626(0xC554aFfE2f581F5E0811e0D42D484ECaC5c6B8e2);
        // Donor of USDC
        erc4626State.underlyingDonor = 0x464Aec9Fa2a78F3312bb155e82f7D1b063A336BE;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
