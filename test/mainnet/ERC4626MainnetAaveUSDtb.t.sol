// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaveUSDtbTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 23384731;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // USDtb
        erc4626State.wrapper = IERC4626(0x2FE4dC166ADbc0B39EdB47F4324F00A7374daBF7);
        // Donor of USDtb
        erc4626State.underlyingDonor = 0x2B5AB59163a6e93b4486f6055D33CA4a115Dd4D5;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
