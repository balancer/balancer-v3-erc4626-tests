// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveCoreUSDTTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 90408149;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // waCoreUSDT
        erc4626State.wrapper = IERC4626(0x2E4BA06fF97E10D09FA4F5a270e97301eae729A9);
        // Donor of USDt tokens
        erc4626State.underlyingDonor = 0x5754284f345afc66a98fbB0a0Afe71e0F007B949;
        erc4626State.amountToDonate = 1e5 * 1e6;
    }
}
