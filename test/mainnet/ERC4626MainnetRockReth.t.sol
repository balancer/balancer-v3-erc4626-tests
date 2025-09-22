// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetRockRethTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 23420297;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Rock Reth
        erc4626State.wrapper = IERC4626(0x936faCdf10c8c36294e7b9d28345255539d81bc7);
        // Donor of rETH tokens
        erc4626State.underlyingDonor = 0xCc9EE9483f662091a1de4795249E24aC0aC2630f;
        erc4626State.amountToDonate = 100 * 1e18;
    }
}
