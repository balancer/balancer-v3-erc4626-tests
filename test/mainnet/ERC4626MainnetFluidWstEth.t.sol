// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetFluidWstEthTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();

        // This token has a minimum amount to deposit and mint, or else it fails.
        minDeposit = 1.1e6;
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";

        // Fluid's WstETH
        wrapper = IERC4626(0x2411802D8BEA09be0aF8fD8D08314a63e706b29C);
        // Donor of WstETH tokens
        underlyingDonor = 0x12B54025C112Aa61fAce2CDB7118740875A566E9;
        // The wrapper has a maximum amount to deposit and withdraw, or else it fails.
        amountToDonate = 1e3 * 1e18;
    }
}
