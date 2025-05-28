// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAvalonsUSDaTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 21804781;

        // Avalon sUSDa
        wrapper = IERC4626(0x1Bf08B4f49E6aeAa0a59C241d74Fe1DDB8327693);
        // Donor of solvBTC
        underlyingDonor = 0x32f8E5d3F4039d1DF89B6A1e544288289A500Fd1;
        amountToDonate = 10 * 1e18;
    }
}
