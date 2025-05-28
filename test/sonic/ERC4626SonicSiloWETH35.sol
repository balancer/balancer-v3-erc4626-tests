// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicSiloV2WETH35Test is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();

        // By default Silo V2 uses 21 decimals for their ERC4626 implementation.
        // Specifically to support balancer boosted pools, they've deployed markets with 18 decimals that truncate
        // the last 3 decimal places. Since the additional 3 digits of precision are always 0 and only used as an
        // additional layer of security against first deposit attacks, it does not impact the functioning of the market.
        // As such, the conversion rate is 1:1000, which we account for here by overwriting underlyingToWrappedFactor
        underlyingToWrappedFactor = 1000;
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 18725346;

        // Silo V2's WETH in market 35
        wrapper = IERC4626(0x08C320A84a59c6f533e0DcA655cf497594BCa1F9);
        // Donor of ws
        underlyingDonor = 0xa5cd24d9792F4F131f5976Af935A505D19c8Db2b;
        amountToDonate = 100 * 1e18;
    }
}
