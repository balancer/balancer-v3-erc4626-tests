// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadAaveSUSDeTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 89235053;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave Monad sUSDe
        erc4626State.wrapper = IERC4626(0x4eC854a6fDF52Eb64F8CabF87FafD3B1f1743a00);
        // Donor of sUSDe
        erc4626State.underlyingDonor = 0xee30116C0B175eC95d422f6bA12691108D84BE74;
        erc4626State.amountToDonate = 5e2 * 1e18;
    }
}
