// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaveLidoWstEthTest is ERC4626WrapperBaseTest {
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
        // Aave's Lido WstETH
        wrapper = IERC4626(0x775F661b0bD1739349b9A2A3EF60be277c5d2D29);
        // Donor of WstETH tokens
        underlyingDonor = 0x12B54025C112Aa61fAce2CDB7118740875A566E9;
        amountToDonate = 1e5 * 1e18;
    }
}
