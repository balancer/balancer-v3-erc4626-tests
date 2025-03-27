// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetSuperformUsdcTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";
        overrideBlockNumber = 21747569;

        // Superform USDC
        wrapper = IERC4626(0xF7DE3c70F2db39a188A81052d2f3C8e3e217822a);
        // Donor of USDC tokens
        underlyingDonor = 0x37305B1cD40574E4C5Ce33f8e8306Be057fD7341;
        amountToDonate = 1e6 * 1e6;
    }
}
