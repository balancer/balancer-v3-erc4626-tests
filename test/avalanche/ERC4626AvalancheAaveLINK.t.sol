// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveLINKTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aLINK
        erc4626State.wrapper = IERC4626(0x61933AF56431280EE4e5667133D8aF6322D64B32);
        // Donor of LINK tokens
        erc4626State.underlyingDonor = 0x4e9f683A27a6BdAD3FC2764003759277e93696e6;
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
