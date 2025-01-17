// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAvalonTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 4239843;

        // Avalon solvBTC
        wrapper = IERC4626(0x7Db17DF22FCF3aF3422c5668c056349e16c487f1);
        // Donor of solvBTC
        underlyingDonor = 0x5b0a78dE3350EbC3f3260EC90EB7C4CB2Db58B21;
        amountToDonate = 10 * 1e18;
    }
}
