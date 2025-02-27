// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626EulerMEVwETHTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 10486777;

        // Euler wETH vault in MEV-Capital cluster
        wrapper = IERC4626(0xa5cd24d9792F4F131f5976Af935A505D19c8Db2b);
        // Donor of wETH
        underlyingDonor = 0xC291CA0a0a0e793dC6A0442a34E1607Ce1905389;
        amountToDonate = 50 * 1e18;
    }
}
