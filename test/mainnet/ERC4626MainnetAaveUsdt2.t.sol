// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaveUsdt2Test is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";

        // Aave's USDT
        wrapper = IERC4626(0x7Bc3485026Ac48b6cf9BaF0A377477Fff5703Af8);
        // Donor of USDT
        underlyingDonor = 0xF977814e90dA44bFA03b6295A0616a897441aceC;
        amountToDonate = 1e6 * 1e6;
    }
}
