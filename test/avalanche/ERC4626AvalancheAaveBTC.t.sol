// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveBTCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's abtc.b
        erc4626State.wrapper = IERC4626(0x2d324fD1Ca86D90f61B0965d2db2f86d22eA4B74);
        // Donor of wbtc tokens
        erc4626State.underlyingDonor = 0x8ffDf2DE812095b1D19CB146E4c004587C0A0692;
        erc4626State.amountToDonate = 1e3 * 1e8;
    }
}
