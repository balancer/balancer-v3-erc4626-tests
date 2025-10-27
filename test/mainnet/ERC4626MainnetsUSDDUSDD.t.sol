// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetsUSDDUSDDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 23576485;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // sUSDD
        erc4626State.wrapper = IERC4626(0xC5d6A7B61d18AfA11435a889557b068BB9f29930);
        // Donor of USDD tokens
        erc4626State.underlyingDonor = 0x18709E89BD403F470088aBDAcEbE86CC60dda12e;
        erc4626State.amountToDonate = 1e3 * 1e18;
    }
}
