// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626PlasmaAaveSUSDeTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "plasma";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's waSUSDe
        erc4626State.wrapper = IERC4626(0xA31C7dDAD8F1D66D037C4EE76F8fb725f927Bc25);
        // Donor of sUSDe
        erc4626State.underlyingDonor = 0x8cd34466193EC736dFc64bDf3892f0321FeE9c35;
        erc4626State.amountToDonate = 50 * 1e18;
    }
}
