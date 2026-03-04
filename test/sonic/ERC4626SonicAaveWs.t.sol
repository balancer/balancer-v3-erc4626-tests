// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAaveWsTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 13405152;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave WS
        erc4626State.wrapper = IERC4626(0x18B7B8695165290f2767BC63c36D3dFEa4C0F9bB);
        // Donor of WS
        erc4626State.underlyingDonor = 0xE223C8e92AA91e966CA31d5C6590fF7167E25801;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
