// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadAaveWETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 85383178;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave Monad WETH
        erc4626State.wrapper = IERC4626(0x967d427eF0Eb4AEB7a1B523A98B04061F094276B);
        // Donor of WETH
        erc4626State.underlyingDonor = 0xB0F05ee6CDDf2f8b6e13C05bD7516f4bf9F03144;
        erc4626State.amountToDonate = 4 * 1e18;
    }
}
