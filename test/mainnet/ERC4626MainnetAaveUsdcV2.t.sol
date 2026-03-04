// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaveUsdcV2Test is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aUsdc
        erc4626State.wrapper = IERC4626(0xD4fa2D31b7968E448877f69A96DE69f5de8cD23E);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0x4B16c5dE96EB2117bBE5fd171E4d203624B014aa;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
