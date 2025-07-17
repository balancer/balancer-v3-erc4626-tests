// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveWETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aWETH
        erc4626State.wrapper = IERC4626(0xdFD2b2437a94108323045C282fF1916de5Ac6Af7);
        // Donor of WETH tokens
        erc4626State.underlyingDonor = 0xe50fA9b3c56FfB159cB0FCA61F5c9D750e8128c8;
        erc4626State.amountToDonate = 100 * 1e18;
    }
}
