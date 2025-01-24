// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseMorphSparkUSDCTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "base";
        // overrideBlockNumber = 25445829;

        // Morpho Spark USDC
        wrapper = IERC4626(0x7BfA7C4f149E7415b73bdeDfe609237e29CBF34A);

        underlyingDonor = 0xee81B5Afc73Cf528778E0ED98622e434E5eFADb4;
        amountToDonate = 1e6 * 1e6;
    }
}
