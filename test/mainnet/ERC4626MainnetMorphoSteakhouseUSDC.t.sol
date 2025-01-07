// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoSteakhouseUsdcTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";
        overrideBlockNumber = 21537026;

        // Morpho's Steakhouse USDC
        wrapper = IERC4626(0x7204B7Dbf9412567835633B6F00C3Edc3a8D6330);
        // Donor of USDC tokens
        underlyingDonor = 0x37305B1cD40574E4C5Ce33f8e8306Be057fD7341;
        amountToDonate = 1e6 * 1e6;
    }
}
