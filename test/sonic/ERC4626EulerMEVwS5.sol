// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626EulerMEVwS5Test is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 20855364;

        // Euler wS vault in MEV-Capital cluster 5
        wrapper = IERC4626(0x90a804D316A06E00755444D56b9eF52e5C4F4D73);
        // Donor of wS
        underlyingDonor = 0xE223C8e92AA91e966CA31d5C6590fF7167E25801;
        amountToDonate = 50 * 1e18;
    }
}
