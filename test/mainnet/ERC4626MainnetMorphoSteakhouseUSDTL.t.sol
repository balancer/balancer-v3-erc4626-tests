// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoSteakhouseUsdtLiteTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";
        overrideBlockNumber = 21735567;

        // Morpho's Steakhouse USDT lite
        wrapper = IERC4626(0x097FFEDb80d4b2Ca6105a07a4D90eB739C45A666);
        // Donor of USDT tokens
        underlyingDonor = 0xF977814e90dA44bFA03b6295A0616a897441aceC;
        amountToDonate = 1e6 * 1e6;
    }
}
