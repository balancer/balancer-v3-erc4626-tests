// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoSteakhouseUsdqTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";
        overrideBlockNumber = 21735567;

        // Morpho's Steakhouse USDQ
        wrapper = IERC4626(0xA1b60d96e5C50dA627095B9381dc5a46AF1a9a42);
        // Donor of USDQ tokens
        underlyingDonor = 0xCED0E43EEebF37e49Faaf064640b1FB228d18a12;
        amountToDonate = 1e6 * 1e6;
    }
}
