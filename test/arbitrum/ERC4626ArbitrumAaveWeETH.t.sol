// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveWeETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "arbitrum";
        forkState.blockNumber = 300110427;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aWeETH
        erc4626State.wrapper = IERC4626(0xD9E3Ef2c12de90E3b03F7b7E3964956a71920d40);
        // Donor of WeETH tokens
        erc4626State.underlyingDonor = 0xa6C895EB332E91c5b3D00B7baeEAae478cc502DA;
        erc4626State.amountToDonate = 1e3 * 1e18;
    }
}
