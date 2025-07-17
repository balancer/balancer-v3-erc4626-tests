// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveWstETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "arbitrum";
        forkState.blockNumber = 300110427;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's awstETH
        erc4626State.wrapper = IERC4626(0xe98fc055c99DECD8Da0c111B090885d5d15C774E);
        // Donor of wstETH tokens
        erc4626State.underlyingDonor = 0x52Aa899454998Be5b000Ad077a46Bbe360F4e497;
        erc4626State.amountToDonate = 1e3 * 1e18;
    }
}
