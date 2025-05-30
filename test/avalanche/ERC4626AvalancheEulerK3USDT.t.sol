// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheEulerK3USDTTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 60456702;

        // Euler USDT
        wrapper = IERC4626(0xa446938b0204Aa4055cdFEd68Ddf0E0d1BAB3E9E);
        // Donor of USDT tokens
        // Note: The aUSDT token fails to mint and deposit if amountToDonate > 4e5 USDT tokens. (Donor has enough
        // liquidity)
        underlyingDonor = 0x5754284f345afc66a98fbB0a0Afe71e0F007B949;
        amountToDonate = 4e5 * 1e6;
    }
}
