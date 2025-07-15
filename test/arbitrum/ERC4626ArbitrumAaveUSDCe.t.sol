// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveUSDCeTest is ERC4626WrapperBaseTest {
    function _setupFork() internal override returns (ForkState memory forkState) {
        forkState.network = "arbitrum";
        forkState.blockNumber = 300110427;
    }

    function _setUpForkTestVariables()
        internal
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate)
    {
        // Aave's aUSDCe
        wrapper = IERC4626(0xE6D5923281c89DC989D00817387292387552d5C1);
        // Donor of USDCe tokens
        underlyingDonor = 0x1eED63EfBA5f81D95bfe37d82C8E736b974F477b;
        amountToDonate = 1e6 * 1e6;
    }
}
