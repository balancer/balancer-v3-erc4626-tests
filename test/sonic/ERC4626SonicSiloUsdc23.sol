// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicSiloV2Usdc23Test is ERC4626WrapperBaseTest {
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
        overrideBlockNumber = 6634482;

        // Silo V2's usdc in market 23
        erc4626State.wrapper = IERC4626(0x5954ce6671d97D24B782920ddCdBB4b1E63aB2De);
        // Donor of usdce
        erc4626State.underlyingDonor = 0x4E216C15697C1392fE59e1014B009505E05810Df;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
