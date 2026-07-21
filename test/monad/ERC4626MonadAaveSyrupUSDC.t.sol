// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadAaveSyrupUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 89235053;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave Monad syrupUSDC
        erc4626State.wrapper = IERC4626(0x6f2cdF03c8343E1eA608668812Fb094E46C41C80);
        // Donor of syrupUSDC
        erc4626State.underlyingDonor = 0x2570fAF7C8A0da87d3F123B35cC722EC3fCC3e08;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
