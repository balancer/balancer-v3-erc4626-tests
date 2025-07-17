// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseFluidWethTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (ERC4626SetupState memory erc4626State minDeposit)
    {
        // Fluid's WETH
        erc4626State.wrapper = IERC4626(0x9272D6153133175175Bc276512B2336BE3931CE9);
        // Donor of WETH tokens
        erc4626State.underlyingDonor = 0xD4a0e0b9149BCee3C920d2E00b5dE09138fd8bb7;
        // The wrapper has a maximum amount to deposit and withdraw, or else it fails.
        erc4626State.amountToDonate = 1e3 * 1e18;
        // This token has specific minimum deposit and mint requirements, so we need to override the default here.
        erc4626State.minDeposit = 2e6;
    }
}
