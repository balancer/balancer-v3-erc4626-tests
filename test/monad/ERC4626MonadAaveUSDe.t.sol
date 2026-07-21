// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadAaveUSDeTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 89235053;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave Monad USDe
        erc4626State.wrapper = IERC4626(0xDc00342D80de85a8b843Dab1f29bb407B3abeB64);
        // Donor of USDe
        erc4626State.underlyingDonor = 0x2156f29D64f81701B58877129006E8b1964149B6;
        erc4626State.amountToDonate = 2e3 * 1e18;
    }
}
