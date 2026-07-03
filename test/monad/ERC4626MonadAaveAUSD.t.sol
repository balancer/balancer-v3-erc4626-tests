// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadAaveAUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 85383178;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave Monad AUSD
        erc4626State.wrapper = IERC4626(0x9e1AcC5BFbf34e2E579763cE14042d957719fE76);
        // Donor of AUSD
        erc4626State.underlyingDonor = 0x1Ee9Edb83f55f7f8C8599A4423bC577aBcD8fdA9;
        erc4626State.amountToDonate = 5e3 * 1e6;
    }
}
