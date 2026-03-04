// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveWbtcTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 135730240;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's WBTC
        erc4626State.wrapper = IERC4626(0xEA9020a9e04C557478daD749A1aaD242b443042C);
        // Donor of WBTC tokens
        erc4626State.underlyingDonor = 0x078f358208685046a11C85e8ad32895DED33A249;
        erc4626State.amountToDonate = 100 * 1e8;
    }
}
