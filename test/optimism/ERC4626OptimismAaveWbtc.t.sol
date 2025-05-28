// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveWbtcTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135730240;

        // Aave's WBTC
        wrapper = IERC4626(0xEA9020a9e04C557478daD749A1aaD242b443042C);
        // Donor of WBTC tokens
        underlyingDonor = 0x078f358208685046a11C85e8ad32895DED33A249;
        amountToDonate = 100 * 1e8;
    }
}
