// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626VicunaVaultSTS is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 15814743;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Vicuna STS vault
        erc4626State.wrapper = IERC4626(0xdB1E39faC2EeeEdB49198735B12a8e598a84510c);
        // Donor of STS
        erc4626State.underlyingDonor = 0x396922EF30Cf012973343f7174db850c7D265278;
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
