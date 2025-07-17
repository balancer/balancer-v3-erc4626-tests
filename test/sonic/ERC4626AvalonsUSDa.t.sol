// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAvalonsUSDaTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 21804781;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Avalon sUSDa
        erc4626State.wrapper = IERC4626(0x1Bf08B4f49E6aeAa0a59C241d74Fe1DDB8327693);
        // Donor of solvBTC
        erc4626State.underlyingDonor = 0x32f8E5d3F4039d1DF89B6A1e544288289A500Fd1;
        erc4626State.amountToDonate = 10 * 1e18;
    }
}
