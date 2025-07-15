// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SepoliaAaveUsdcTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sepolia";
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Aave's static aUSDC
        wrapper = IERC4626(0x8A88124522dbBF1E56352ba3DE1d9F78C143751e);
        // Donor of USDC
        underlyingDonor = 0x0F97F07d7473EFB5c846FB2b6c201eC1E316E994;
        amountToDonate = 1e6 * 1e6;
    }
}
