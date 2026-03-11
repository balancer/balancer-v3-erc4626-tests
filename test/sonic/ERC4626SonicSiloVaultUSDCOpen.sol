// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicSiloVaultUSDCOpenTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 64998885;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Silo USDC vault
        erc4626State.wrapper = IERC4626(0x423a7A5709213dEa0F0C2368e5fB16338c87bBA7);
        // Donor of USDC
        erc4626State.underlyingDonor = 0x7Ca1F5C11e298b8e5F6D8DdCC685a90c95DD8B44;
        erc4626State.amountToDonate = 1e6 * 1e6;

        // Silo uses 24 decimals for this ERC4626 implementation.
        // The additional 6 digits of precision are always 0 and only used as an additional layer of security against
        // first deposit attacks, it does not impact the functioning of the market. As such, the conversion rate is
        // 1:1000000, which we account for here by overwriting underlyingToWrappedFactor
        erc4626State.underlyingToWrappedFactor = 1000000;
    }
}
