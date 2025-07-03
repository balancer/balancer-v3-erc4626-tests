// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626EulerMEVscETHTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 10486777;

        // Euler scETH vault in MEV-Capital cluster
        wrapper = IERC4626(0x0806af1762Bdd85B167825ab1a64E31CF9497038);
        // Donor of scETH
        underlyingDonor = 0x455d5f11Fea33A8fa9D3e285930b478B6bF85265;
        amountToDonate = 50 * 1e18;
    }
}
