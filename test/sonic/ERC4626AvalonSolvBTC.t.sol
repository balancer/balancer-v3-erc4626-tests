// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAvalonSolvBTCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 4820900;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Avalon solvBTC
        wrapper = IERC4626(0xD31E89Ffb929b38bA60D1c7dBeB68c7712EAAb0a);
        // Donor of solvBTC
        underlyingDonor = 0x5b0a78dE3350EbC3f3260EC90EB7C4CB2Db58B21;
        amountToDonate = 10 * 1e18;
    }
}
