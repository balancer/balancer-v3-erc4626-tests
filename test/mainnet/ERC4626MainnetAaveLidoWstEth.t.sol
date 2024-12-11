// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaveLidoWstEthTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";

        // Aave's Lido WstETH
        wrapper = IERC4626(0x775F661b0bD1739349b9A2A3EF60be277c5d2D29);
        // Donor of WstETH tokens
        underlyingDonor = 0x12B54025C112Aa61fAce2CDB7118740875A566E9;
        amountToDonate = 1e5 * 1e18;
    }
}
