// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseMorphoIonicUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Morpho Ionic USDC
        erc4626State.wrapper = IERC4626(0x23479229e52Ab6aaD312D0B03DF9F33B46753B5e);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0x425fc782110110e2aFD2677e3C91EA77Fd7e0A47;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
