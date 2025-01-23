// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicSiloV2SolvBTCTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 5022201;

        // Silo V2's solvBTC
        wrapper = IERC4626(0x87178fe8698C7eDa8aA207083C3d66aEa569aB98);
        // Donor of solvBTC
        underlyingDonor = 0x6c56DDcCB3726fAa089A5e9E29b712525Cf916D7;
        amountToDonate = 50 * 1e18;
    }
}
