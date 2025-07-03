// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveBTCTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 59394164;

        // Aave's abtc.b
        wrapper = IERC4626(0x2d324fD1Ca86D90f61B0965d2db2f86d22eA4B74);
        // Donor of wbtc tokens
        underlyingDonor = 0x8ffDf2DE812095b1D19CB146E4c004587C0A0692;
        amountToDonate = 1e3 * 1e8;
    }
}
