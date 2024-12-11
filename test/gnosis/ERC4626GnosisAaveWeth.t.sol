// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626GnosisAaveWethTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "gnosis";

        // Aave's Weth
        wrapper = IERC4626(0x57f664882F762FA37903FC864e2B633D384B411A);
        // Donor of Weth
        underlyingDonor = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;
        amountToDonate = 500 * 1e18;
    }
}
