// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheEulerRe7savUSDTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 60456702;

        // Euler savUSD
        wrapper = IERC4626(0x72F92a966f1874f74e1b601BEe7CF57031B53A03);
        // Donor of savUSD tokens
        underlyingDonor = 0x72F92a966f1874f74e1b601BEe7CF57031B53A03;
        amountToDonate = 1e6 * 1e18;
    }
}
