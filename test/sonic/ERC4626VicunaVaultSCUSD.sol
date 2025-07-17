// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626VicunaVaultSCUSD is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 15814743;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Vicuna scUSD vault
        erc4626State.wrapper = IERC4626(0x711a93a8bD6803aF0a6122F2dE18c1a6AB7CB29C);
        // Donor of scUSD
        erc4626State.underlyingDonor = 0xeEb1DC1Ca7ffC5b54aD1cc4c1088Db4E5657Cb6c;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
