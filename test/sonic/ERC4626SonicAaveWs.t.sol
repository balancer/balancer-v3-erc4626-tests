// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAaveWsTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 12031248;

        // Aave WS
        wrapper = IERC4626(0x18B7B8695165290f2767BC63c36D3dFEa4C0F9bB);
        // Donor of WS
        underlyingDonor = 0xE223C8e92AA91e966CA31d5C6590fF7167E25801;
        amountToDonate = 1e6 * 1e18;
    }
}
