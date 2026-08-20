// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandCbBTCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 97149203;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland cbBTC
        erc4626State.wrapper = IERC4626(0x98a297e6424787E57Af119949d7E00b721F832BB);
        // Donor of cbBTC tokens
        erc4626State.underlyingDonor = 0xb05d9532dA4Fa1Eb7b8d620e3a7E0A774c818428;
        erc4626State.amountToDonate = 1e8;
    }
}
