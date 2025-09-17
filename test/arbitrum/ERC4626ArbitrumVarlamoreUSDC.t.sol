// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumVarlamoreUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "arbitrum";
        forkState.blockNumber = 378061399;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Varlamore USDC
        erc4626State.wrapper = IERC4626(0x2BA39e5388aC6C702Cb29AEA78d52aa66832f1ee);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0x2Df1c51E09aECF9cacB7bc98cB1742757f163dF7;
        erc4626State.amountToDonate = 1e5 * 1e6;

        // This token has 1_000_000_000_000_000_000 (1e18) wrapped tokens for each underlying, so a redeem of any
        // value below 1e18 would return 0 assets, which reverts.
        erc4626State.underlyingToWrappedFactor = 1e18;
    }
}
