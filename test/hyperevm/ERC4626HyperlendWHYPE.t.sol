// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HyperlendWHYPE is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 9614546;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Hyperlend WHYPE
        erc4626State.wrapper = IERC4626(0xD704254eb350E0D3BaeCD194d095862267897aE0);

        // Donor of WHYPE
        erc4626State.underlyingDonor = 0x39EbBA742B6917D49D4a9Ac7cf5c70f84d34cC9E;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
