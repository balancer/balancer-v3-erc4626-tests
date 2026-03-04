// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveUSDCTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aUSDC
        erc4626State.wrapper = IERC4626(0xe1bFC96d95BAdCB10Ff013Cb0C9C6c737ca07009);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0x9f8c163cBA728e99993ABe7495F06c0A3c8Ac8b9;
        erc4626State.amountToDonate = 1e7 * 1e6;
    }
}
