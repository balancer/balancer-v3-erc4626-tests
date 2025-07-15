// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveWethTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
        forkState.blockNumber = 25630845;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Aave's Weth
        wrapper = IERC4626(0xe298b938631f750DD409fB18227C4a23dCdaab9b);
        // Donor of Weth tokens
        underlyingDonor = 0xb2cc224c1c9feE385f8ad6a55b4d94E92359DC59;
        amountToDonate = 1e2 * 1e8;
    }
}
