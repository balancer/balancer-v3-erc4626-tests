// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626FelixUSDT0Test is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 9622601;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Felix's USDT0
        erc4626State.wrapper = IERC4626(0xFc5126377F0efc0041C0969Ef9BA903Ce67d151e);

        // Donor of USDT0
        erc4626State.underlyingDonor = 0x200000000000000000000000000000000000010C;
        erc4626State.amountToDonate = 1e5 * 1e6;
    }
}
