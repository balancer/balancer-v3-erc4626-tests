// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetYearnWethTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Yearn's yvWeth
        wrapper = IERC4626(0xc56413869c6CDf96496f2b1eF801fEDBdFA7dDB0);
        // Donor of Weth
        underlyingDonor = 0xF04a5cC80B1E94C69B48f5ee68a08CD2F09A7c3E;
        amountToDonate = 1e6 * 1e6;
    }
}
