// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandGMONTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 58687139;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland GMON
        erc4626State.wrapper = IERC4626(0x29D2075E5151B1A6863bDC40EA86bD5e8aFd1705);
        // Donor of GMON
        erc4626State.underlyingDonor = 0xee41d6528B3e1fdB71dDB214a771A28F25D8B206;
        
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
