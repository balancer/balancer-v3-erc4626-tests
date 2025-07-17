// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626EulerMEVwSTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 18723271;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Euler wS vault in MEV-Capital cluster
        wrapper = IERC4626(0x9144C0F0614dD0acE859C61CC37e5386d2Ada43A);
        // Donor of wETH
        underlyingDonor = 0x6C5E14A212c1C3e4Baf6f871ac9B1a969918c131;
        amountToDonate = 1e6 * 1e18;
    }
}
