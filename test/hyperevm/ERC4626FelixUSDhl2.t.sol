// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626FelixUSDhl2 is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 10937211;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Felix's feUSDhl2
        erc4626State.wrapper = IERC4626(0x66c71204B70aE27BE6dC3eb41F9aF5868E68fDb6);

        // Donor of usdhl
        erc4626State.underlyingDonor = 0x2000000000000000000000000000000000000123;
        erc4626State.amountToDonate = 1e5 * 1e6; // 1 million usdhl
    }
}
