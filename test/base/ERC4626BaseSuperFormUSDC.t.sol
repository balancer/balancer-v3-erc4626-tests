// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseSuperformUsdcTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "base";
        overrideBlockNumber = 25787269;

        // Superform USDC
        wrapper = IERC4626(0xe9F2a5F9f3c846f29066d7fB3564F8E6B6b2D65b);
        // Donor of USDC tokens
        underlyingDonor = 0xee81B5Afc73Cf528778E0ED98622e434E5eFADb4;
        amountToDonate = 1e6 * 1e6;
    }
}
