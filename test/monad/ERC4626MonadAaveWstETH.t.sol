// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadAaveWstETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 89235053;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave Monad wstETH
        erc4626State.wrapper = IERC4626(0x50591A9F86972C591b6FE858b465f5B65d5c24ee);
        // Donor of wstETH
        erc4626State.underlyingDonor = 0xd52929B69680A6f74D2eB9c8F1ef482f37b1b32B;
        erc4626State.amountToDonate = 1e18;
    }
}
