// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetsiUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 22545890;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Staked iUSD USDT
        wrapper = IERC4626(0xDBDC1Ef57537E34680B898E1FEBD3D68c7389bCB);
        // Donor of iUSD
        underlyingDonor = 0x9e8b926A0EB276eB380fb8282eA20c2A2faea967;
        amountToDonate = 1e3 * 1e18;
    }
}
