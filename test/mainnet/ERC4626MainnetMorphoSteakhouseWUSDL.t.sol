// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoSteakhouseWUSDLTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";

        // Morpho's Steakhouse wUSDL
        wrapper = IERC4626(0xbEeFc011e94f43b8B7b455eBaB290C7Ab4E216f1);
        // Donor of wUSDL tokens
        underlyingDonor = 0xbA1333333333a1BA1108E8412f11850A5C319bA9;
        amountToDonate = 10_000 * 1e18;
    }
}
