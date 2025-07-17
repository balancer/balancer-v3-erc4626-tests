// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheEulerRe7savUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 60456702;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Euler savUSD
        erc4626State.wrapper = IERC4626(0x72F92a966f1874f74e1b601BEe7CF57031B53A03);
        // Donor of savUSD tokens
        erc4626State.underlyingDonor = 0x72F92a966f1874f74e1b601BEe7CF57031B53A03;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
