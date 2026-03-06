// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoWethTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 24498706;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // ZCHF Vault
        erc4626State.wrapper = IERC4626(0xE5F130253fF137f9917C0107659A4c5262abf6b0);
        // Donor of zchf
        erc4626State.underlyingDonor = 0x61C32D0056f6A13C8BbBFE8D76D6a3ac6ee3a798;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
