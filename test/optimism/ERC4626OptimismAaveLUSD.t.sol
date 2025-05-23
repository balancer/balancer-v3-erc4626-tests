// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveLUSDTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135729365;

        // Aave's LUSD
        wrapper = IERC4626(0x413093E03d6aeE4F2F7e48D4b88881bf4932b249);
        // Donor of LUSD tokens
        underlyingDonor = 0x4F3da11c5caDf644ae023Dbad01008a934C993E2;
        amountToDonate = 10000 * 1e18;
    }
}
