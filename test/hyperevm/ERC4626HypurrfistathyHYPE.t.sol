// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HypurrfistathyHYPETest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 11788355;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Hypurrfi's USDT0
        erc4626State.wrapper = IERC4626(0x3Df418bE6Dad3f824d00A7c516DAd3Ea2A5a79C6);

        // Donor of USDT0
        erc4626State.underlyingDonor = 0x39EbBA742B6917D49D4a9Ac7cf5c70f84d34cC9E;
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
