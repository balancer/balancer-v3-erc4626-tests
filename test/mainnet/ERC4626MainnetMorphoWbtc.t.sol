// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoWbtcTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Morpho's maWBTC
        wrapper = IERC4626(0xd508F85F1511aAeC63434E26aeB6d10bE0188dC7);
        // Donor of WBTC tokens
        underlyingDonor = 0x5Ee5bf7ae06D1Be5997A1A72006FE6C607eC6DE8;
        amountToDonate = 5e3 * 1e8;
    }
}
