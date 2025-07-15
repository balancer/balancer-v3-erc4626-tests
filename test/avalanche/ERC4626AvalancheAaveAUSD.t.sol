// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveAUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables()
        internal
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate)
    {
        // Aave's aAUSD
        wrapper = IERC4626(0x45cf39EeB437FA95Bb9b52c0105254a6BD25D01e);
        // Donor of AUSD tokens
        // Note: The aAUSD token fails to mint and deposit if amountToDonate > 8e5 AUSD tokens. (Donor has enough
        // liquidity)
        underlyingDonor = 0x190D94613A09ad7931FcD17CD6A8F9B6B47ad414;
        amountToDonate = 8e5 * 1e6;
    }
}
