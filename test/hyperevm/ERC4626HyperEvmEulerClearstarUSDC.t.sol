// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HyperEvmEulerClearstarUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 36228000;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // csUSDC (Clearstar Earn USDC)
        erc4626State.wrapper = IERC4626(0xF868A2B30854FE13e26F7AB7a92609cCb6b9c0e1);

        // Donor of USDC
        erc4626State.underlyingDonor = 0x02631682AA6039b096B7A764Ba0AE555F658fC24;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
