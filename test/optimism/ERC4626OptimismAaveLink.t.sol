// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveLinkTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 135730595;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Aave's aLINK
        wrapper = IERC4626(0xC438643b0eee8a314eEC53eb8A1Ee6467C88fc24);
        // Donor of LINK tokens
        underlyingDonor = 0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530;
        amountToDonate = 10000 * 1e18;
    }
}
