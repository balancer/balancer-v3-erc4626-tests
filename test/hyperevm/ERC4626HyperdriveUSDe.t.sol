// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626FelixUSDeTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 8130654;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Hyperdrive's USDe
        erc4626State.wrapper = IERC4626(0x167101B7994c1c206B5A20A401b1F771EDbE988f);

        // Donor of USDe
        erc4626State.underlyingDonor = 0x68e37dE8d93d3496ae143F2E900490f6280C57cD;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
