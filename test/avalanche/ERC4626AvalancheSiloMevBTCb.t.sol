// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheSiloMevBTCbTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 68825324;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Silo BTC.b
        erc4626State.wrapper = IERC4626(0x1f8E769B5B6010B2C2BBCd68629EA1a0a0Eda7E3);
        // Donor of BTC tokens
        erc4626State.underlyingDonor = 0x89a415b3D20098E6A6C8f7a59001C67BD3129821;
        erc4626State.amountToDonate = 1e2 * 1e8;

        erc4626State.underlyingToWrappedFactor = 1000000;
    }
}
