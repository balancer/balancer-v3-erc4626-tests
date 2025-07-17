// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveOPTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 135730240;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aOP
        erc4626State.wrapper = IERC4626(0x712Ef4D78f43ecAfa106ea003704a908C99D7f11);
        // Donor of OP tokens
        erc4626State.underlyingDonor = 0x2A82Ae142b2e62Cb7D10b55E323ACB1Cab663a26;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
