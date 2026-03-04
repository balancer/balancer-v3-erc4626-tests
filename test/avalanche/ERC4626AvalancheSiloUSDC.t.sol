// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheSiloUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 68265091;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Silo's aUSDC
        erc4626State.wrapper = IERC4626(0x4dc1ce9b9f9EF00c144BfAD305f16c62293dC0E8);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0x859592A4A469610E573f96Ef87A0e5565F9a94c8;
        erc4626State.amountToDonate = 1e5 * 1e6;

        // This token has 1_000_000 wrapped tokens for each underlying, so any amount of wrapped below 1_000_000 would
        // return 0 assets, which reverts.
        erc4626State.underlyingToWrappedFactor = 1000000;
    }
}
