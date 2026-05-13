// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HyperlendkHYPE is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 35015979;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Static Hyperlend kHYPE
        erc4626State.wrapper = IERC4626(0xb2A2104D9fC202a38d74d8F6c3c45Da6eef8F5e0);

        // Donor of kHYPE
        erc4626State.underlyingDonor = 0x63AF859d7b4717bd4D3705F15B6d4cAAd6CF4b36;
        erc4626State.amountToDonate = 1e3 * 1e18;
    }
}
