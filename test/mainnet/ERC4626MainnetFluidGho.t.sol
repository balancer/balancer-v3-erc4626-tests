// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetFluidGhoTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();

        // This token has a minimum amount to deposit and mint, or else it fails.
        minDeposit = 1e9;
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";

        // Fluid's GHO
        wrapper = IERC4626(0x6A29A46E21C730DcA1d8b23d637c101cec605C5B);
        // Donor of GHO tokens
        underlyingDonor = 0x1a88Df1cFe15Af22B3c4c783D4e6F7F9e0C1885d;
        amountToDonate = 1e6 * 1e18;
    }
}
