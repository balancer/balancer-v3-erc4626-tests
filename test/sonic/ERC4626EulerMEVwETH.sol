// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626EulerMEVwETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 10486777;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Euler wETH vault in MEV-Capital cluster
        wrapper = IERC4626(0xa5cd24d9792F4F131f5976Af935A505D19c8Db2b);
        // Donor of wETH
        underlyingDonor = 0xC291CA0a0a0e793dC6A0442a34E1607Ce1905389;
        amountToDonate = 50 * 1e18;
    }
}
