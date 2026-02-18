// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheSilogUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 73605580;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Silo's gUSDC
        erc4626State.wrapper = IERC4626(0x1F0570a081FeE0e4dF6eAC470f9d2D53CDEDa1c5);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0xEe7aE85f2Fe2239E27D9c1E23fFFe168D63b4055;
        erc4626State.amountToDonate = 1e5 * 1e6;

        // This token has 1_000_000 wrapped tokens for each underlying, so any amount of wrapped below 1_000_000 would
        // return 0 assets, which reverts.
        erc4626State.underlyingToWrappedFactor = 1000000;
    }
}
