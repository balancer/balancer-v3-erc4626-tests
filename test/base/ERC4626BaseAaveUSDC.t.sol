// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveUSDCTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "base";
        overrideBlockNumber = 25630845;

        // Aave's aUSDC
        wrapper = IERC4626(0xC768c589647798a6EE01A91FdE98EF2ed046DBD6);
        // Donor of USDC tokens
        underlyingDonor = 0x0B0A5886664376F59C351ba3f598C8A8B4D0A6f3;
        amountToDonate = 1e6 * 1e6;
    }
}
