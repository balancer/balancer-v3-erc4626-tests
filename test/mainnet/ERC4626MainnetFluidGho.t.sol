// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetFluidGhoTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 21587513;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256 minDeposit)
    {
        // Fluid's GHO
        wrapper = IERC4626(0x6A29A46E21C730DcA1d8b23d637c101cec605C5B);
        // Donor of GHO tokens
        underlyingDonor = 0x1a88Df1cFe15Af22B3c4c783D4e6F7F9e0C1885d;
        amountToDonate = 1e6 * 1e18;
        // This token has specific minimum deposit and mint requirements, so we need to override the default here.
        minDeposit = 1e9;
    }
}
