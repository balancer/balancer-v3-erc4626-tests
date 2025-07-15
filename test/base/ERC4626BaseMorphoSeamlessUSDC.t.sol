// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseMorphoSeamlessUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Morpho Seamless USDC
        wrapper = IERC4626(0x616a4E1db48e22028f6bbf20444Cd3b8e3273738);
        // Donor of USDC tokens
        underlyingDonor = 0xee81B5Afc73Cf528778E0ED98622e434E5eFADb4;
        amountToDonate = 1e6 * 1e6;
    }
}
