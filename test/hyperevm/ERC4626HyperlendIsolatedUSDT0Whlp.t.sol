// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HyperlendIsolatedUSDT0WhlpTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 9200000;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Hyperlend's isolated USDT0/WHLP pool
        erc4626State.wrapper = IERC4626(0x06Fd9D03b3d0F18E4919919b72D30c582f0a97E5);

        // Donor of USDT0
        erc4626State.underlyingDonor = 0x56aBfaf40F5B7464e9cC8cFF1af13863D6914508;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
