// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseMorphoSeamlessUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Morpho Seamless USDC
        erc4626State.wrapper = IERC4626(0x616a4E1db48e22028f6bbf20444Cd3b8e3273738);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0xee81B5Afc73Cf528778E0ED98622e434E5eFADb4;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
