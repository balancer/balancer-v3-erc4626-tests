// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandAUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 55175610;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland AUSD
        erc4626State.wrapper = IERC4626(0x82c370ba90E38ef6Acd8b1b078d34fD86FC6bAC9);
        // Donor of AUSD
        erc4626State.underlyingDonor = 0xf33286E3222D1c829dACeac48c0Ec651F6452470;
        
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
