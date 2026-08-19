// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandWBTCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 97149203;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland WBTC
        erc4626State.wrapper = IERC4626(0x8959f4E6ED1f4567a464959793d5f8f6f33C1C8B);
        // Donor of WBTC tokens (largest WBTC holder on Monad, a contract holding ~11.44 WBTC at the pinned block;
        // no EOA on the chain holds the required 3x amountToDonate)
        erc4626State.underlyingDonor = 0x9f127B66B1620D97de98746C27e245612E40285c;
        erc4626State.amountToDonate = 2e8;
    }
}
