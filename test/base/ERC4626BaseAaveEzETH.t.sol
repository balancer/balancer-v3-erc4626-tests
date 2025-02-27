// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveEzETHTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "base";
        overrideBlockNumber = 25630845;

        // Aave's aezETH
        wrapper = IERC4626(0xF8F10f39116716e89498c1c5E94137ADa11b2BC7);
        // Donor of ezETH tokens
        underlyingDonor = 0xBBBBBbbBBb9cC5e90e3b3Af64bdAF62C37EEFFCb;
        amountToDonate = 200 * 1e18;
    }
}
