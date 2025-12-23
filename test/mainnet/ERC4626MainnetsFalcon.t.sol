// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetsFalconTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 24048809;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Morpho's Steakhouse wUSDL
        erc4626State.wrapper = IERC4626(0xc8CF6D7991f15525488b2A83Df53468D682Ba4B0);
        // Donor of wUSDL tokens
        erc4626State.underlyingDonor = 0x742d35Cc6634C0532925a3b844Bc454e4438f44e;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
