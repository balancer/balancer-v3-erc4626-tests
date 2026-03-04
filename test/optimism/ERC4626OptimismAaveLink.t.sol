// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveLinkTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 135730595;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aLINK
        erc4626State.wrapper = IERC4626(0xC438643b0eee8a314eEC53eb8A1Ee6467C88fc24);
        // Donor of LINK tokens
        erc4626State.underlyingDonor = 0x191c10Aa4AF7C30e871E70C95dB0E4eb77237530;
        erc4626State.amountToDonate = 10000 * 1e18;
    }
}
