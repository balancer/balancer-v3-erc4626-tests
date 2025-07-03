// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveGHOTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "arbitrum";
        overrideBlockNumber = 300110427;

        // Aave's aGHO
        wrapper = IERC4626(0xD089B4cb88Dacf4e27be869A00e9f7e2E3C18193);
        // Donor of GHO tokens
        underlyingDonor = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;
        amountToDonate = 1e4 * 1e18;
    }
}
