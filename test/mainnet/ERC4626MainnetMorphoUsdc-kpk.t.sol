// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoUsdckpkTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 23897761;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Morpho's kpk USDC
        erc4626State.wrapper = IERC4626(0x4Ef53d2cAa51C447fdFEEedee8F07FD1962C9ee6);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0x37305B1cD40574E4C5Ce33f8e8306Be057fD7341;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
