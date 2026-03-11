// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HypurrfiIsolatedUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 26807629;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Hypurrfi's USDC
        erc4626State.wrapper = IERC4626(0xC200AaB602Cd7046389B5C8FB088884323F8dD0f);

        // Donor of USDC
        erc4626State.underlyingDonor = 0x24a44f1dc25540c62c1196FfC297dFC951C91aB4;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
