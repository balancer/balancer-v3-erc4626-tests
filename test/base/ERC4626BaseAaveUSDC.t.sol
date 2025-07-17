// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
        forkState.blockNumber = 25630845;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aUSDC
        erc4626State.wrapper = IERC4626(0xC768c589647798a6EE01A91FdE98EF2ed046DBD6);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0x0B0A5886664376F59C351ba3f598C8A8B4D0A6f3;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
