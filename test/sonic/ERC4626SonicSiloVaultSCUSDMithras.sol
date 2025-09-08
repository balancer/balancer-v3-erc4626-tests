// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicSiloVaultSCUSDMithrasTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 46137781;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Silo SCUSD vault
        erc4626State.wrapper = IERC4626(0x391b3F70E254d582588B27e97E48D1CFcdf0BE7e);
        // Donor of scUSD
        erc4626State.underlyingDonor = 0xB38D431e932fEa77d1dF0AE0dFE4400c97e597B8;
        erc4626State.amountToDonate = 1e5 * 1e6;

        // By default Silo V2 uses 21 decimals for their ERC4626 implementation.
        // Specifically to support balancer boosted pools, they've deployed markets with 18 decimals that truncate
        // the last 3 decimal places. Since the additional 3 digits of precision are always 0 and only used as an
        // additional layer of security against first deposit attacks, it does not impact the functioning of the market.
        // As such, the conversion rate is 1:1000, which we account for here by overwriting underlyingToWrappedFactor
        erc4626State.underlyingToWrappedFactor = 1e18;
    }
}
