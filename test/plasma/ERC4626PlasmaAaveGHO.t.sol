// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626PlasmaAaveGHOTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "plasma";
        forkState.blockNumber = 16401895;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's Stata GHO
        erc4626State.wrapper = IERC4626(0x28C48A7630A730F5f2297dA7A72b7F31d9E99e19);
        // Donor of GHO
        erc4626State.underlyingDonor = 0x6aC541605b0317dE076C9FeC2842902c844dEa74;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
