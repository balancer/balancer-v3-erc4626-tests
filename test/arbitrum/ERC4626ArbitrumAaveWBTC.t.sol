// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveWBTC is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "arbitrum";
        overrideBlockNumber = 300110427;

        // Aave's aWBTC
        wrapper = IERC4626(0x52Dc1FEeFA4f9a99221F93D79da46Ae89b8c0967);
        // Donor of WBTC tokens
        underlyingDonor = 0x7C11F78Ce78768518D743E81Fdfa2F860C6b9A77;
        amountToDonate = 50 * 1e8;
    }
}
