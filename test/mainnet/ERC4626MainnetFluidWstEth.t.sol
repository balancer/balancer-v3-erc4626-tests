// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetFluidWstEthTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Fluid's WstETH
        erc4626State.wrapper = IERC4626(0x2411802D8BEA09be0aF8fD8D08314a63e706b29C);
        // Donor of WstETH tokens
        erc4626State.underlyingDonor = 0x12B54025C112Aa61fAce2CDB7118740875A566E9;
        // The wrapper has a maximum amount to deposit and withdraw, or else it fails.
        erc4626State.amountToDonate = 1e3 * 1e18;
        // This token has specific minimum deposit and mint requirements, so we need to override the default here.
        erc4626State.minDeposit = 1.1e6;
    }
}
