// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandXAUt0Test is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 97149203;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland XAUt0
        erc4626State.wrapper = IERC4626(0x22139A346b6312EB0A9812C67CfCe4A694676d59);
        // Donor of XAUt0 tokens
        erc4626State.underlyingDonor = 0xf89d7b9c864f589bbF53a82105107622B35EaA40;
        erc4626State.amountToDonate = 5e6;
    }
}
