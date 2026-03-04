// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveLINKTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "arbitrum";
        forkState.blockNumber = 300110427;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aLINK
        erc4626State.wrapper = IERC4626(0xEAB84053B99f2ec4433F5121A1CB1524c8c998F8);
        // Donor of LINK tokens
        erc4626State.underlyingDonor = 0x7f1fa204bb700853D36994DA19F830b6Ad18455C;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
