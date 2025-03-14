// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626VicunaVaultSTS is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 13631382;

        // Vicuna USDT vault
        wrapper = IERC4626(0xd2C390d663a5D9504366D280A8Fc40B02A0417D8);
        // Donor of USDT
        underlyingDonor = 0x396922EF30Cf012973343f7174db850c7D265278;
        amountToDonate = 1e4 * 1e18;
    }
}
