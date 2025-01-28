// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveARBTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "arbitrum";
        overrideBlockNumber = 300110427;

        // Aave's aARB
        wrapper = IERC4626(0xf09EDbF2655B2A56753bD60D22CeAB2AC5D04188);
        // Donor of ARB tokens
        underlyingDonor = 0xF977814e90dA44bFA03b6295A0616a897441aceC;
        amountToDonate = 1e6 * 1e18;
    }
}
