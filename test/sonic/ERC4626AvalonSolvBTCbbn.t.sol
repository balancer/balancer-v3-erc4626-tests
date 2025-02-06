// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAvalonSolvBTCbbnTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 4820900;

        // Avalon solvBTC.bbn
        wrapper = IERC4626(0xA28d4dbcC90C849e3249D642f356D85296a12954);
        // Donor of solvBTC.bbn
        underlyingDonor = 0xe3a97c4Cc6725B96fb133c636D2e88Cc3d6CfdBE;
        amountToDonate = 1 * 1e16;
    }
}
