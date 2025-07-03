// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveWETHTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 59394164;

        // Aave's aWETH
        wrapper = IERC4626(0xdFD2b2437a94108323045C282fF1916de5Ac6Af7);
        // Donor of WETH tokens
        underlyingDonor = 0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8;
        amountToDonate = 100 * 1e18;
    }
}
