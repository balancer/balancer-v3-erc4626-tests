// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveCbETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
        forkState.blockNumber = 25630845;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's acbETH
        erc4626State.wrapper = IERC4626(0x5e8B674127B321DC344c078e58BBACc3f3008962);
        // Donor of cbETH tokens
        erc4626State.underlyingDonor = 0x3bf93770f2d4a794c3d9EBEfBAeBAE2a8f09A5E5;
        erc4626State.amountToDonate = 1e3 * 1e18;
    }
}
