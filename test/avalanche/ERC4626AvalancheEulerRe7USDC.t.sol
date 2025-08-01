// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheEulerRe7USDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Eurler USDC
        erc4626State.wrapper = IERC4626(0x39dE0f00189306062D79eDEC6DcA5bb6bFd108f9);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0x9f8c163cBA728e99993ABe7495F06c0A3c8Ac8b9;
        erc4626State.amountToDonate = 1e7 * 1e6;
    }
}
