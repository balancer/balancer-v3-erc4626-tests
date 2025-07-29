// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HyperbeatMCHypeTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 9630897;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Hypearbeat's WHYPE
        erc4626State.wrapper = IERC4626(0xd19e3d00f8547f7d108abFD4bbb015486437B487);

        // Donor of WHYPE
        erc4626State.underlyingDonor = 0x68e37dE8d93d3496ae143F2E900490f6280C57cD;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
