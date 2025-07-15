// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaveLidoGhoTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 21587513;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Lido Aave's GHO
        wrapper = IERC4626(0xC71Ea051a5F82c67ADcF634c36FFE6334793D24C);
        // Donor of GHO tokens
        underlyingDonor = 0x1a88Df1cFe15Af22B3c4c783D4e6F7F9e0C1885d;
        amountToDonate = 1e6 * 1e18;
    }
}
