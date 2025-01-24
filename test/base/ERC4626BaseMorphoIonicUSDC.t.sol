// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseMorphoIonicUSDCTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "base";
        // overrideBlockNumber = ???;

        // Morpho Ionic USDC
        wrapper = IERC4626(0x23479229e52Ab6aaD312D0B03DF9F33B46753B5e);

        underlyingDonor = 0x1985EA6E9c68E1C272d8209f3B478AC2Fdb25c87;
        amountToDonate = 1e6 * 1e6;
    }
}
