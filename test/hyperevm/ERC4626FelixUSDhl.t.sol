// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626FelixUSDhl is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 9176950;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Felix's feUSDhl
        erc4626State.wrapper = IERC4626(0x9c59a9389D8f72DE2CdAf1126F36EA4790E2275e);

        // Donor of usdhl
        erc4626State.underlyingDonor = 0x2000000000000000000000000000000000000123;
        erc4626State.amountToDonate = 2357062673661;
    }
}
