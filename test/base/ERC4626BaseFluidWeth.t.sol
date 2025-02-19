// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseFluidWethTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();

        // This token has specific minimum deposit and mint requirements, so we need to override the default here.
        minDeposit = 2e6;
    }

    function setUpForkTestVariables() internal override {
        network = "base";

        // Fluid's WETH
        wrapper = IERC4626(0x9272D6153133175175Bc276512B2336BE3931CE9);
        // Donor of WETH tokens
        underlyingDonor = 0xD4a0e0b9149BCee3C920d2E00b5dE09138fd8bb7;
        // The wrapper has a maximum amount to deposit and withdraw, or else it fails.
        amountToDonate = 1e3 * 1e18;
    }
}
