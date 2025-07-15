// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoSteakhouseUsdrTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 21735567;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Morpho's Steakhouse USDR
        wrapper = IERC4626(0x30881Baa943777f92DC934d53D3bFdF33382cab3);
        // Donor of USDR tokens
        underlyingDonor = 0x77134cbC06cB00b66F4c7e623D5fdBF6777635EC; // Bitfinex Hot Wallet
        amountToDonate = 1e4 * 1e6;
    }
}
