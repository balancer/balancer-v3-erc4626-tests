// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumFluidWethTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();

        // This token has specific minimum deposit and mint requirements, so we need to override the default here.
        minDeposit = 2e6;
    }

    function setUpForkTestVariables() internal override {
        network = "arbitrum";

        // Fluid's WETH
        wrapper = IERC4626(0x45Df0656F8aDf017590009d2f1898eeca4F0a205);
        // Donor of WETH tokens
        underlyingDonor = 0x450bb6774Dd8a756274E0ab4107953259d2ac541;
        // The wrapper has a maximum amount to deposit and withdraw, or else it fails.
        amountToDonate = 1e3 * 1e18;
    }
}
