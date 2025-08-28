// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetStcUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 23240773;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Staked cap USD
        erc4626State.wrapper = IERC4626(0x88887bE419578051FF9F4eb6C858A951921D8888);
        // Donor of cUSD
        erc4626State.underlyingDonor = 0xB40AfddF577Ae584e0494023F37D4F77AFc5773f;
        erc4626State.amountToDonate = 1e3 * 1e18;
    }
}
