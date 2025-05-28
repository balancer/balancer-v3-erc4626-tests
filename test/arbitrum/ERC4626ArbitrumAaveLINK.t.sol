// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveLINKTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "arbitrum";
        overrideBlockNumber = 300110427;

        // Aave's aLINK
        wrapper = IERC4626(0xEAB84053B99f2ec4433F5121A1CB1524c8c998F8);
        // Donor of LINK tokens
        underlyingDonor = 0x7f1fa204bb700853D36994DA19F830b6Ad18455C;
        amountToDonate = 1e5 * 1e18;
    }
}
