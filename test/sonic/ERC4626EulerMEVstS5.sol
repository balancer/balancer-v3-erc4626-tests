// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626EulerMEVstS5Test is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 20855364;

        // Euler stS vault in MEV-Capital cluster 5
        wrapper = IERC4626(0x6832F3090867449c058e1e3088E552E12AB18F9E);
        // Donor of stS
        underlyingDonor = 0x396922EF30Cf012973343f7174db850c7D265278;
        amountToDonate = 50 * 1e18;
    }
}
