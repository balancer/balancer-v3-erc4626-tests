// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicSiloVaultUSDCTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();

        // By default Silo V2 uses 21 decimals for their ERC4626 implementation.
        // Specifically to support balancer boosted pools, they've deployed markets with 18 decimals that truncate
        // the last 3 decimal places. Since the additional 3 digits of precision are always 0 and only used as an
        // additional layer of security against first deposit attacks, it does not impact the functioning of the market.
        // As such, the conversion rate is 1:1000, which we account for here by overwriting underlyingToWrappedFactor
        underlyingToWrappedFactor = 1e18;
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 22895600;

        // Silo USDC vault
        erc4626State.wrapper = IERC4626(0xF6F87073cF8929C206A77b0694619DC776F89885);
        // Donor of usdc
        erc4626State.underlyingDonor = 0x578Ee1ca3a8E1b54554Da1Bf7C583506C4CD11c6;
        erc4626State.amountToDonate = 10000 * 1e6;
    }
}
