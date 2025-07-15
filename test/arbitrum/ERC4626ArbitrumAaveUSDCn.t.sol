// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveUSDCnTest is ERC4626WrapperBaseTest {
    function _setupFork() internal override returns (ForkState memory forkState) {
        forkState.network = "arbitrum";
        forkState.blockNumber = 300110427;
    }

    function _setUpForkTestVariables()
        internal
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate)
    {
        // Aave's aUSDCn
        wrapper = IERC4626(0x7F6501d3B98eE91f9b9535E4b0ac710Fb0f9e0bc);
        // Donor of USDCn tokens
        underlyingDonor = 0xB38e8c17e38363aF6EbdCb3dAE12e0243582891D;
        amountToDonate = 1e6 * 1e6;
    }
}
