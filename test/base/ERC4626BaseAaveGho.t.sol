// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveGhoTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "base";
        overrideBlockNumber = 26253497;

        // Aave's GHO
        wrapper = IERC4626(0x88b1Cd4b430D95b406E382C3cDBaE54697a0286E);
        // Donor of GHO tokens
        underlyingDonor = 0x54E939c5134F237510e1a21b0d42a00D70Ab8213;
        amountToDonate = 2e3 * 1e18;
    }
}
