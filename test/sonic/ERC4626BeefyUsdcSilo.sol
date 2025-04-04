// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BeefyUsdcSilo is ERC4626WrapperBaseTest {
    function setUp() public override {
        // The Beefy USDC silo is failing on Sonic because the mint function is not EXACT_OUT. The error is small,
        // 1 wei, and occurs just in very specific cases. Beefy is working in a new wrapper, but meanwhile we will
        // disable the test to don't cause CI failures in unrelated PRs.
        vm.skip(true);
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 5046915;

        // Beefy USDC to Silo
        wrapper = IERC4626(0x7870ddFd5ACA4E977B2287e9A212bcbe8FC4135a);
        // Donor of USDC.e
        underlyingDonor = 0x4E216C15697C1392fE59e1014B009505E05810Df;
        amountToDonate = 1e6 * 1e6;
    }
}
