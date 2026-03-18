// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetYearnBoldTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 24686015;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Yearn's yvUSDC
        erc4626State.wrapper = IERC4626(0x9F4330700a36B29952869fac9b33f45EEdd8A3d8);
        // Donor of USDC
        erc4626State.underlyingDonor = 0x9502b7c397E9aa22FE9dB7EF7DAF21cD2AEBe56B;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
