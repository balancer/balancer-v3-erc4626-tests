// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMResolvWstUSRTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";
        overrideBlockNumber = 22179810;

        // Resolv wstUSR
        wrapper = IERC4626(0x1202F5C7b4B9E47a1A484E8B270be34dbbC75055);
        // Donor of USDR tokens
        underlyingDonor = 0xD2eE2776F34Ef4E7325745b06E6d464b08D4be0E;
        amountToDonate = 1e5 * 1e18;
    }
}
