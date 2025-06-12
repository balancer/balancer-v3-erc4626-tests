// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicStabilityWSTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 33536213;

        // Stability WS
        wrapper = IERC4626(0xffFFFFFf2fcBeFAe12F1372C56edC769BD411685);
        // Donor of ws
        underlyingDonor = 0x6C5E14A212c1C3e4Baf6f871ac9B1a969918c131;
        amountToDonate = 1e6 * 1e18;
    }
}
