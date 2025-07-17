// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveLUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 135729365;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's LUSD
        erc4626State.wrapper = IERC4626(0x413093E03d6aeE4F2F7e48D4b88881bf4932b249);
        // Donor of LUSD tokens
        erc4626State.underlyingDonor = 0x4F3da11c5caDf644ae023Dbad01008a934C993E2;
        erc4626State.amountToDonate = 10000 * 1e18;
    }
}
