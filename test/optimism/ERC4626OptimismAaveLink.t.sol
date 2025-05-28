// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveLinkTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135730595;

        // Aave's aLINK
        wrapper = IERC4626(0xC438643b0eee8a314eEC53eb8A1Ee6467C88fc24);
        // Donor of LINK tokens
        underlyingDonor = 0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530;
        amountToDonate = 10000 * 1e18;
    }
}
