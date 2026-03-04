// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetSFraxTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // sFrax
        erc4626State.wrapper = IERC4626(0xA663B02CF0a4b149d2aD41910CB81e23e1c41c32);
        // Donor of FRAX tokens
        erc4626State.underlyingDonor = 0xcE6431D21E3fb1036CE9973a3312368ED96F5CE7;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
