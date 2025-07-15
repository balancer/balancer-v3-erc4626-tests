// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HyperlendUSDT0Test is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Hyperlend's hUSDT0
        wrapper = IERC4626(0xb99E85bCF89d483506125701Bb98957542e47a0F);

        // Donor of USDT0
        underlyingDonor = 0x56aBfaf40F5B7464e9cC8cFF1af13863D6914508;
        amountToDonate = 1e5 * 1e6;
    }
}
