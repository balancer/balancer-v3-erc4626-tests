// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadAaveGHOTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 85383178;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave Monad GHO
        erc4626State.wrapper = IERC4626(0x7c9e74e6C6E5DafAf9b44F60bf8eBbe81CA70d4F);
        // Donor of GHO
        erc4626State.underlyingDonor = 0x4f6872A24ff019550048668094da427DcD49723a;
        erc4626State.amountToDonate = 1e1 * 1e18;
    }
}
