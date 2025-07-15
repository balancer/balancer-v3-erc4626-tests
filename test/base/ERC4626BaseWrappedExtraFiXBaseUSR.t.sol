// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseWrappedExtraFiXBaseUSRTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
        forkState.blockNumber = 30905678;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Wrapped ExtraFi X Base USR
        wrapper = IERC4626(0x98eFe85735F253a0ed0Be8e2915ff39f9e4AfF0F);
        // Donor of USR tokens
        underlyingDonor = 0x4665d514e82B2F9c78Fa2B984e450F33d9efc842;
        // The `deposit` function fails with an amount greater than 1e4 * 1e18, because of a boundary in the wrapped
        // token.
        amountToDonate = 1e4 * 1e18;
    }
}
