// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveUSDTTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "arbitrum";
        forkState.blockNumber = 300110427;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aUSDT
        erc4626State.wrapper = IERC4626(0xa6D12574eFB239FC1D2099732bd8b5dC6306897F);
        // Donor of USDT tokens
        erc4626State.underlyingDonor = 0xB38e8c17e38363aF6EbdCb3dAE12e0243582891D;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
