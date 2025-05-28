// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaverlUSDTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";
        overrideBlockNumber = 22439030;

        // Aave's rlUSD
        wrapper = IERC4626(0x6A1792a91C08e9f0bFe7a990871B786643237f0F);
        // Donor of WETH tokens
        underlyingDonor = 0xFa82580c16A31D0c1bC632A36F82e83EfEF3Eec0;
        amountToDonate = 1e5 * 1e18;
    }
}
