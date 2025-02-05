// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveEzETHTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "arbitrum";

        // Aave's ezETH wrapper
        wrapper = IERC4626(0x4ff50C17df0D1b788d021ACd85039810a1aA68A1);
        // Donor of ezETH tokens
        underlyingDonor = 0x6f7D514bbD4aFf3BcD1140B7344b32f063dEe486;
        // 500 ezETH
        amountToDonate = 500 * 1e18;
    }
}
