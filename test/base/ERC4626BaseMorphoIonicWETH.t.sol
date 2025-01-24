// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseMorphoIonicWETHTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "base";
        overrideBlockNumber = 25458827;

        // Morpho Ionic Ecosystem WETH
        wrapper = IERC4626(0x5A32099837D89E3a794a44fb131CBbAD41f87a8C);

        underlyingDonor = 0x621e7c767004266c8109e83143ab0Da521B650d6;
        amountToDonate = 1e5 * 1e18;
    }
}
