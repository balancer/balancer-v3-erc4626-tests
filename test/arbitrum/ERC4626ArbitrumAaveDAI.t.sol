// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveDAITest is ERC4626WrapperBaseTest {
    function _setupFork() internal override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "arbitrum";
        forkState.blockNumber = 300110427;
    }

    function _setUpForkTestVariables()
        internal
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate)
    {
        // Aave's aDAI
        wrapper = IERC4626(0xf253BD61aEd0E9D62523eA76CD6F38B4a51dA145);
        // Donor of DAI tokens
        underlyingDonor = 0x2d070ed1321871841245D8EE5B84bD2712644322;
        amountToDonate = 1e5 * 1e18;
    }
}
