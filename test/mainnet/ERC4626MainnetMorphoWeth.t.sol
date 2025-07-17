// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoWethTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Morpho's maWETH
        erc4626State.wrapper = IERC4626(0x490BBbc2485e99989Ba39b34802faFa58e26ABa4);
        // Donor of WETH tokens
        erc4626State.underlyingDonor = 0xF04a5cC80B1E94C69B48f5ee68a08CD2F09A7c3E;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
