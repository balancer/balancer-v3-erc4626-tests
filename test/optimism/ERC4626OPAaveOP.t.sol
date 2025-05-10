// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OPAaveOPTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135132800;

        // Aave's aOP
        wrapper = IERC4626(0x712Ef4D78f43ecAfa106ea003704a908C99D7f11);
        // Donor of OP tokens
        underlyingDonor = 0x2A82Ae142b2e62Cb7D10b55E323ACB1Cab663a26;
        amountToDonate = 1e5 * 1e18;
    }
}
