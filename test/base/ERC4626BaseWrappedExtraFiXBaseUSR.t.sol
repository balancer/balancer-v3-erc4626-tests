// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseWrappedExtraFiXBaseUSRTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "base";
        overrideBlockNumber = 30905678;

        // Wrapped ExtraFi X Base USR
        wrapper = IERC4626(0x98eFe85735F253a0ed0Be8e2915ff39f9e4AfF0F);
        // Donor of USR tokens
        underlyingDonor = 0x4665d514e82B2F9c78Fa2B984e450F33d9efc842;
        amountToDonate = 1e4 * 1e18;
    }
}
