// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadCurvanceBlbAUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 95000000;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // blbAUSD
        erc4626State.wrapper = IERC4626(0xC2ddc1004CA0d6cC4bFd1dCD03Dcf855bED8E670);
        // Donor of AUSD tokens
        erc4626State.underlyingDonor = 0xE04183D60D7088EAfD1c84BD01E566bC61b5d2bF;
        erc4626State.amountToDonate = 5e3 * 1e6;
        // Unwinding from the underlying Curvance market rounds down by a wei, which the vault rejects as a loss on
        // very small amounts. 0.1 AUSD clears that floor.
        erc4626State.minDeposit = 1e5;
    }
}
