// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetsDOLATest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 24471490;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // sDOLA
        erc4626State.wrapper = IERC4626(0xb45ad160634c528Cc3D2926d9807104FA3157305);
        // Donor of DOLA
        erc4626State.underlyingDonor = 0x64273624eb57c5cA961d366CBF3968e760Bf0452;
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
