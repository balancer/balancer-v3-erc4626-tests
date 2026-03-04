// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveEzETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "arbitrum";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's ezETH wrapper
        erc4626State.wrapper = IERC4626(0x4ff50C17df0D1b788d021ACd85039810a1aA68A1);
        // Donor of ezETH tokens
        erc4626State.underlyingDonor = 0x6f7D514bbD4aFf3BcD1140B7344b32f063dEe486;
        // 500 ezETH
        erc4626State.amountToDonate = 500 * 1e18;
    }
}
