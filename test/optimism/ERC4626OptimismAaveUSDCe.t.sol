// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveUSDCETest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 135730240;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Aave's aUSDCe
        wrapper = IERC4626(0x0B590eF479c8e03825Ae779839aCb4583aCc15FD);
        // Donor of USDCe tokens
        underlyingDonor = 0xDecC0c09c3B5f6e92EF4184125D5648a66E35298;
        amountToDonate = 1e6 * 1e6;
    }
}
