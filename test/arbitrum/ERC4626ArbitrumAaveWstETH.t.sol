// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveWstETHTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "arbitrum";
        overrideBlockNumber = 300110427;

        // Aave's awstETH
        wrapper = IERC4626(0xe98fc055c99DECD8Da0c111B090885d5d15C774E);
        // Donor of wstETH tokens
        underlyingDonor = 0x52Aa899454998Be5b000Ad077a46Bbe360F4e497;
        amountToDonate = 1e3 * 1e18;
    }
}
