// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicStabilityscUSDTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 33536213;

        // Stability scUSD
        wrapper = IERC4626(0xccccCCcca9FC69a2b32408730011EdB3205A93A1);
        // Donor of scUSD
        underlyingDonor = 0xe6605932e4a686534D19005BB9dB0FBA1F101272;
        amountToDonate = 1e6 * 1e6;
    }
}
