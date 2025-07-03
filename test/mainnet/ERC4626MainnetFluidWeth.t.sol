// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetFluidWethTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();

        // This token has specific minimum deposit and mint requirements, so we need to override the default here.
        minDeposit = 2e6;
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";

        // Fluid's WETH
        wrapper = IERC4626(0x90551c1795392094FE6D29B758EcCD233cFAa260);
        // Donor of WETH tokens
        underlyingDonor = 0xF04a5cC80B1E94C69B48f5ee68a08CD2F09A7c3E;
        // The wrapper has a maximum amount to deposit and withdraw, or else it fails.
        amountToDonate = 1e3 * 1e18;
    }
}
