// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandWETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 70932767;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland WETH
        erc4626State.wrapper = IERC4626(0xB3b850ac62B89fe9f4eFB652b516108a8aEb8848);
        // Donor of WETH
        erc4626State.underlyingDonor = 0x59ABc0e437971d585c2bc4d69DC8B31F2f23E855;

        erc4626State.amountToDonate = 1e2 * 1e18;
    }
}
