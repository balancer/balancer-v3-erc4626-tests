// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveGhoTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
        forkState.blockNumber = 26253497;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's GHO
        erc4626State.wrapper = IERC4626(0x88b1Cd4b430D95b406E382C3cDBaE54697a0286E);
        // Donor of GHO tokens
        erc4626State.underlyingDonor = 0x54E939c5134F237510e1a21b0d42a00D70Ab8213;
        erc4626State.amountToDonate = 2e3 * 1e18;
    }
}
