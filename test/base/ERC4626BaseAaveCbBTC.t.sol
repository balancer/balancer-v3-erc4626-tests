// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveCbBTCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "base";
        forkState.blockNumber = 25630845;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's acbBTC
        erc4626State.wrapper = IERC4626(0xFA2A03b6f4A65fB1Af64f7d935fDBf78693df9aF);
        // Donor of cbBTC tokens
        erc4626State.underlyingDonor = 0xF877ACaFA28c19b96727966690b2f44d35aD5976;
        erc4626State.amountToDonate = 1e2 * 1e8;
    }
}
