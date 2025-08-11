// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626Sonic246AaveUsdc is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 42515772;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Club246 restaked  aUSDC
        erc4626State.wrapper = IERC4626(0x561d1907dd7C0B92E5278356BC230B7e94704d57);
        // Donor of aUSDC
        erc4626State.underlyingDonor = 0xc4A9d8b486f388CC0E4168d2904277e8C8372FA3;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
