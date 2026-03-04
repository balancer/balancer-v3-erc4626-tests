// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumFluidWethTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "arbitrum";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Fluid's WETH
        erc4626State.wrapper = IERC4626(0x45Df0656F8aDf017590009d2f1898eeca4F0a205);
        // Donor of WETH tokens
        erc4626State.underlyingDonor = 0x450bb6774Dd8a756274E0ab4107953259d2ac541;
        // The wrapper has a maximum amount to deposit and withdraw, or else it fails.
        erc4626State.amountToDonate = 1e3 * 1e18;

        // This token has specific minimum deposit and mint requirements, so we need to override the default here.
        erc4626State.minDeposit = 2e6;
    }
}
