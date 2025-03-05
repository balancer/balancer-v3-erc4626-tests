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
        overrideBlockNumber = 11804781;

        // Avalon sUSDa
        wrapper = IERC4626(0x1Bf08B4f49E6aeAa0a59C241d74Fe1DDB8327693);
        // Donor of solvBTC
        underlyingDonor = 0x91Aee6cC85Ab68A02C288F8d8e7A4F5A704Ad746;
        amountToDonate = 10 * 1e18;
    }
}
