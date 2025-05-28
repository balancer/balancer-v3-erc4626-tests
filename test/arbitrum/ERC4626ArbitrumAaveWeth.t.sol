// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveWethTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "arbitrum";
        overrideBlockNumber = 300110427;

        // Aave's aWETH
        wrapper = IERC4626(0x4cE13a79f45C1Be00BdABD38B764aC28C082704E);
        // Donor of WETH tokens
        underlyingDonor = 0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8;
        amountToDonate = 5e3 * 1e18;
    }
}
