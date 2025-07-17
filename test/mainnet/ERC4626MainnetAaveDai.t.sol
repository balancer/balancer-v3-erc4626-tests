// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaveDaiTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aDai
        erc4626State.wrapper = IERC4626(0xaf270C38fF895EA3f95Ed488CEACe2386F038249);
        // Donor of DAI tokens
        erc4626State.underlyingDonor = 0x40ec5B33f54e0E8A33A975908C5BA1c14e5BbbDf;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
