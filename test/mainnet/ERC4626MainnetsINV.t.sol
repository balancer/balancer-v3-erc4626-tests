// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetsINVTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 24471490;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // sINV
        erc4626State.wrapper = IERC4626(0x08d23468A467d2bb86FaE0e32F247A26C7E2e994);
        // Donor of INV
        erc4626State.underlyingDonor = 0x1637e4e9941D55703a7A5E7807d6aDA3f7DCD61B;
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
