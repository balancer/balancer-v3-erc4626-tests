// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveDAITest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 135729365;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Aave's aDAI
        wrapper = IERC4626(0x61b620FAd391b53A2D0973b10a3Ed69558d5c66E);
        // Donor of DAI tokens
        underlyingDonor = 0x1eED63EfBA5f81D95bfe37d82C8E736b974F477b;
        amountToDonate = 1e6 * 1e18;
    }
}
