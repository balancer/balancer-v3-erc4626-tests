// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OPAaveUSDCTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135132900;

        // Aave's aUSDC.e
        wrapper = IERC4626(0x0B590eF479c8e03825Ae779839aCb4583aCc15FD);
        // Donor of USDC.e tokens
        underlyingDonor = 0xDecC0c09c3B5f6e92EF4184125D5648a66E35298;
        amountToDonate = 1e5 * 1e6;
    }
}
