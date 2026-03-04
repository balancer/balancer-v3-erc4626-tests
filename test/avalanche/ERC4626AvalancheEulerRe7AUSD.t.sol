// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheEulerRe7AUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Euler AUSD
        erc4626State.wrapper = IERC4626(0x2137568666f12fc5A026f5430Ae7194F1C1362aB);
        // Donor of AUSD tokens
        erc4626State.underlyingDonor = 0x190D94613A09ad7931FcD17CD6A8F9B6B47ad414;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
