// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAaveWETHTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 13405152;

        // Aave WS
        wrapper = IERC4626(0xeB5e9B0ae5bb60274786C747A1A2A798c11271E0);
        // Donor of WS
        underlyingDonor = 0xe18Ab82c81E7Eecff32B8A82B1b7d2d23F1EcE96;
        amountToDonate = 1e3 * 1e18;
    }
}
