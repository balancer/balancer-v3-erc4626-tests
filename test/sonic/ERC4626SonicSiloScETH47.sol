// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicSiloV2ScETH47Test is ERC4626WrapperBaseTest {
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
        overrideBlockNumber = 18723271;

        // Silo V2's scETH in market 47
        erc4626State.wrapper = IERC4626(0x24c74B30d1a4261608E84Bf5a618693032681DAc);
        // Donor of scETH
        erc4626State.underlyingDonor = 0x455d5f11Fea33A8fa9D3e285930b478B6bF85265;
        erc4626State.amountToDonate = 500 * 1e18;
    }
}
