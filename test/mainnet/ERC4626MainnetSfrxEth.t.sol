// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetSFrxEthTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // sfrxEth
        erc4626State.wrapper = IERC4626(0xac3E018457B222d93114458476f3E3416Abbe38F);
        // Donor of frxEth tokens
        erc4626State.underlyingDonor = 0xac3E018457B222d93114458476f3E3416Abbe38F;
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
