// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAvalonUSDaTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 11804781;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Avalon USDa
        erc4626State.wrapper = IERC4626(0xB97af8cbD08d182Cc118439ff5d4b547ec16258C);
        // Donor of USDa
        erc4626State.underlyingDonor = 0x9d703fe0324fE009B55e8837F88B4BC131ef77Ad;
        erc4626State.amountToDonate = 10 * 1e18;
    }
}
