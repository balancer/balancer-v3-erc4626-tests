// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseWrappedExtraFiXBaseUSDCTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "base";
        overrideBlockNumber = 30905678;

        // Wrapped ExtraFi X Base USDC
        wrapper = IERC4626(0x589A7339C6d0c8777E7429F57f2f95c069c37288);
        // Donor of USDC tokens
        underlyingDonor = 0xee81B5Afc73Cf528778E0ED98622e434E5eFADb4;
        amountToDonate = 1e6 * 1e6;
    }
}
