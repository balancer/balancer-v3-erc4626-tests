// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SepoliaSOverlayerWrapTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sepolia";
        forkState.blockNumber = 11088000;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // sOverlayerWrap
        erc4626State.wrapper = IERC4626(0x753937137Eb92871A6F3517514d4f1Ee860e3FDF);
        // Donor of USDC+ (C+) tokens
        erc4626State.underlyingDonor = 0x4693fbf98f61Fa33C7b35c9F9c378e836D5d40e5;
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
