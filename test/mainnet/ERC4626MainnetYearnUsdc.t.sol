// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetYearnUsdcTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";

        // Yearn's yvUSDC
        wrapper = IERC4626(0xBe53A109B494E5c9f97b9Cd39Fe969BE68BF6204);
        // Donor of USDC
        underlyingDonor = 0x4B16c5dE96EB2117bBE5fd171E4d203624B014aa;
        amountToDonate = 1e6 * 1e6;
    }
}
