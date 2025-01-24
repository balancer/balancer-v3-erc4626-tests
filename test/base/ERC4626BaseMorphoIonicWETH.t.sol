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

        // Morpho Ionic Ecosystem WETH
        wrapper = IERC4626(0x5A32099837D89E3a794a44fb131CBbAD41f87a8C);
        // Donor of WETH tokens
        underlyingDonor = 0x46a83dC1a264Bff133dB887023d2884167094837;
        amountToDonate = 1e1 * 1e18;
    }
}
