// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetKelpHgEthTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";

        // Kelps hgEth
        wrapper = IERC4626(0xc824A08dB624942c5E5F330d56530cD1598859fD);
        // Donor of underlying tokens (rsETH)
        underlyingDonor = 0x2D62109243b87C4bA3EE7bA1D91B0dD0A074d7b1;
        amountToDonate = 1e4 * 1e18;
    }
}
