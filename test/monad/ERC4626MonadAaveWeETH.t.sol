// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadAaveWeETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 89235053;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave Monad weETH
        erc4626State.wrapper = IERC4626(0xcdc050015042701f6B3af3b87990945d415FA657);
        // Donor of weETH
        erc4626State.underlyingDonor = 0xAE0f77C239f72da36d4dA20a4bBdaAe4Ca48e03F;
        erc4626State.amountToDonate = 5 * 1e18;
    }
}
