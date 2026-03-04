// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMResolvWstUSRTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 22179810;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Resolv wstUSR
        erc4626State.wrapper = IERC4626(0x1202F5C7b4B9E47a1A484E8B270be34dbbC75055);
        // Donor of USDR tokens
        erc4626State.underlyingDonor = 0xD2eE2776F34Ef4E7325745b06E6d464b08D4be0E;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
