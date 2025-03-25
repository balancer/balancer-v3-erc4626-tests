// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626VicunaVaultSCUSD is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 15814743;

        // Vicuna scUSD vault
        wrapper = IERC4626(0x711a93a8bD6803aF0a6122F2dE18c1a6AB7CB29C);
        // Donor of scUSD
        underlyingDonor = 0xeEb1DC1Ca7ffC5b54aD1cc4c1088Db4E5657Cb6c;
        amountToDonate = 1e6 * 1e6;
    }
}
