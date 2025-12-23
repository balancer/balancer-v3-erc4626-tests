// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumMorphoUSDCkpkTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "arbitrum";
        forkState.blockNumber = 405036511;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Morpho's kpk USDC
        erc4626State.wrapper = IERC4626(0x2C609d9CfC9dda2dB5C128B2a665D921ec53579d);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0xEe7aE85f2Fe2239E27D9c1E23fFFe168D63b4055;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
