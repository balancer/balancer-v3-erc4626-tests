// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaveUsdtTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's static aUSDT
        erc4626State.wrapper = IERC4626(0x862c57d48becB45583AEbA3f489696D22466Ca1b);
        // Donor of USDT
        erc4626State.underlyingDonor = 0xF977814e90dA44bFA03b6295A0616a897441aceC;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
