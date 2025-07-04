// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicSiloVaultSCUSDre7Test is ERC4626WrapperBaseTest {
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
        overrideBlockNumber = 35797880;

        // Silo SCUSD vault
        wrapper = IERC4626(0x592D1e187729C76EfacC6dfFB9355bd7BF47B2a7);
        // Donor of scUSD
        underlyingDonor = 0xB38D431e932fEa77d1dF0AE0dFE4400c97e597B8;
        amountToDonate = 1e5 * 1e6;
    }
}
