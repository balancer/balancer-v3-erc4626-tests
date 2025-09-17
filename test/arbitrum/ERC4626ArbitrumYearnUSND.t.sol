// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumYearnUSNDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "arbitrum";
        forkState.blockNumber = 378061399;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Yearn USND
        erc4626State.wrapper = IERC4626(0x252b965400862d94BDa35FeCF7Ee0f204a53Cc36);
        // Donor of USND tokens
        erc4626State.underlyingDonor = 0x6e57181D6b4b7c138a6F956AD16DAF4f27FC5E04;
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
