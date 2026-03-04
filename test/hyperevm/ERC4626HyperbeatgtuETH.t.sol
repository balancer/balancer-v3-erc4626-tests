// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import {IERC4626} from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import {ERC4626WrapperBaseTest, ERC4626SetupState, ForkState} from "../ERC4626WrapperBase.t.sol";

contract ERC4626HyperbeatgtuETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Hyperbeat gtuETH
        erc4626State.wrapper = IERC4626(0x0571362ba5EA9784a97605f57483f865A37dBEAA);

        // Donor of ETH
        erc4626State.underlyingDonor = 0x20000000000000000000000000000000000000dD;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
