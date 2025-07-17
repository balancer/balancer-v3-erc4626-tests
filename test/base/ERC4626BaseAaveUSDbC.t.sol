// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveUSDbCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
        forkState.blockNumber = 25630845;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aUSDbC
        erc4626State.wrapper = IERC4626(0x74D4D1D440c9679b1013999Bd91507eAa2fff651);
        // Donor of USDbC tokens
        erc4626State.underlyingDonor = 0xB4885Bc63399BF5518b994c1d0C153334Ee579D0;
        erc4626State.amountToDonate = 1e5 * 1e6;
    }
}
