// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicSiloVaultDUSDTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();

        // By default Silo V2 uses 21 decimals for their ERC4626 implementation.
        // Specifically to support balancer boosted pools, they've deployed markets with 18 decimals that truncate
        // the last 3 decimal places. Since the additional 3 digits of precision are always 0 and only used as an
        // additional layer of security against first deposit attacks, it does not impact the functioning of the market.
        // As such, the conversion rate is 1:1000, which we account for here by overwriting underlyingToWrappedFactor
        underlyingToWrappedFactor = 1e6;
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 35700282;

        // Silo DUSD vault
        wrapper = IERC4626(0x9A1BF5365edBB99C2c61CA6D9ffAd0B705ACfc6F);
        // Donor of DUSD
        underlyingDonor = 0xdb81ee19ea2E5E1acA04f55D9C6c4188C36a81Fe;
        amountToDonate = 1e4 * 1e18;
    }
}
