// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveEzETHTest is ERC4626WrapperBaseTest {
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
        // Aave's aezETH
        wrapper = IERC4626(0xF8F10f39116716e89498c1c5E94137ADa11b2BC7);
        // Donor of ezETH tokens
        underlyingDonor = 0xBBBBBbbBBb9cC5e90e3b3Af64bdAF62C37EEFFCb;
        amountToDonate = 200 * 1e18;
    }
}
