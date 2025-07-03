// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveUSDCTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 59394164;

        // Aave's aUSDC
        wrapper = IERC4626(0xe1bFC96d95BAdCB10Ff013Cb0C9C6c737ca07009);
        // Donor of USDC tokens
        underlyingDonor = 0x9f8c163cBA728e99993ABe7495F06c0A3c8Ac8b9;
        amountToDonate = 1e7 * 1e6;
    }
}
