// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveWeETHTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "arbitrum";
        overrideBlockNumber = 300110427;

        // Aave's aWeETH
        wrapper = IERC4626(0xD9E3Ef2c12de90E3b03F7b7E3964956a71920d40);
        // Donor of WeETH tokens
        underlyingDonor = 0xa6C895EB332E91c5b3D00B7baeEAae478cc502DA;
        amountToDonate = 1e3 * 1e18;
    }
}
