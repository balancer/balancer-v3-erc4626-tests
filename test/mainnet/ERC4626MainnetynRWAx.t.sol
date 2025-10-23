// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetynRWAxTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 23640577;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // ynRWAx 4626
        erc4626State.wrapper = IERC4626(0x3DB228FE836D99Ccb25Ec4dfdC80ED6d2CDdCB4b);
        // Donor of USDC
        erc4626State.underlyingDonor = 0x37305B1cD40574E4C5Ce33f8e8306Be057fD7341;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
