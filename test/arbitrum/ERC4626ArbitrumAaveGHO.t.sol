// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveGHOTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "arbitrum";
        forkState.blockNumber = 300110427;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aGHO
        erc4626State.wrapper = IERC4626(0xD089B4cb88Dacf4e27be869A00e9f7e2E3C18193);
        // Donor of GHO tokens
        erc4626State.underlyingDonor = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
