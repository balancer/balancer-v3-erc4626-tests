// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626EulerMEVwSTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 18723271;

        // Euler wS vault in MEV-Capital cluster
        wrapper = IERC4626(0x9144C0F0614dD0acE859C61CC37e5386d2Ada43A);
        // Donor of wETH
        underlyingDonor = 0x6C5E14A212c1C3e4Baf6f871ac9B1a969918c131;
        amountToDonate = 1e6 * 1e18;
    }
}
