// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveEURCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
        forkState.blockNumber = 28361837;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Aave's aEURC
        wrapper = IERC4626(0x729F75Aff28c726e32403e80cef2aFb518CFbfa7);
        // Donor of EURC tokens
        underlyingDonor = 0xE846373C1a92B167b4E9cd5d8E4d6B1Db9E90EC7;
        amountToDonate = 1e6 * 1e6;
    }
}
