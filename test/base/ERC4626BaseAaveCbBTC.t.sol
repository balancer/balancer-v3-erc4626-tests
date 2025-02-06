// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveCbBTCTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "base";
        overrideBlockNumber = 25630845;

        // Aave's acbBTC
        wrapper = IERC4626(0xFA2A03b6f4A65fB1Af64f7d935fDBf78693df9aF);
        // Donor of cbBTC tokens
        underlyingDonor = 0xF877ACaFA28c19b96727966690b2f44d35aD5976;
        amountToDonate = 1e2 * 1e8;
    }
}
