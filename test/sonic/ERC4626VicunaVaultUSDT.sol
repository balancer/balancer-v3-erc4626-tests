// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626VicunaVaultUSDT is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 14985047;

        // Vicuna USDT vault
        wrapper = IERC4626(0xf54b4C59a7F3590dF0d6F312F9D41F10EE42f72c);
        // Donor of USDT
        underlyingDonor = 0x0d13400CC7c46D77a43957fE614ba58C827dfde6;
        amountToDonate = 1e4 * 1e6;
    }
}
