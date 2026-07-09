// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaveCoreUsdgTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 25480000;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // waCoreUSDG
        erc4626State.wrapper = IERC4626(0xAC2435E3C25e8246870D33ce0a26988A46d5DB68);
        // Donor of USDG tokens
        erc4626State.underlyingDonor = 0x228c9f02cbB0e6B5Dd191B539770c82918023b09;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
