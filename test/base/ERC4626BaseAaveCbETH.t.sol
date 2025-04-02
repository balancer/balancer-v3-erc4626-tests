// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveCbETHTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "base";
        overrideBlockNumber = 25630845;

        // Aave's acbETH
        wrapper = IERC4626(0x5e8B674127B321DC344c078e58BBACc3f3008962);
        // Donor of cbETH tokens
        underlyingDonor = 0x3bf93770f2d4a794c3d9EBEfBAeBAE2a8f09A5E5;
        amountToDonate = 1e3 * 1e18;
    }
}
