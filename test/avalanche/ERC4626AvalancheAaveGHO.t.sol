// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveGHOTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 64506494;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aGHO
        erc4626State.wrapper = IERC4626(0x79459f4C9AfC902488109D058C3E76ed0B037c41);
        // Donor of GHO tokens
        erc4626State.underlyingDonor = 0xf611aEb5013fD2c0511c9CD55c7dc5C1140741A6;
        erc4626State.amountToDonate = 10 * 1e18;
    }
}
