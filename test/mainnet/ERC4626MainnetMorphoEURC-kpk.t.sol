// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoEURCkpkTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 23897761;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Morpho's kpk EURC
        erc4626State.wrapper = IERC4626(0xa877D5bb0274dcCbA8556154A30E1Ca4021a275f);
        // Donor of EURC tokens
        erc4626State.underlyingDonor = 0xAA6e91C82942aeAE040303Bf96c15a6dBcB82CA0;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
