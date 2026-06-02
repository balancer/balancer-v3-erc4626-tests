// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HyperEvmEulerClearstarUSDT0Test is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 36228000;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // csUSDT0 (Clearstar Earn USDT0)
        erc4626State.wrapper = IERC4626(0x6dd448d5cb73DC96788d5BE605DD3C5c83864a36);

        // Donor of USDT0
        erc4626State.underlyingDonor = 0xBD151BeF567dAbf712A811402A27839768a13D70;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
