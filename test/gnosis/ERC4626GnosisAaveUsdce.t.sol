// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626GnosisAaveUsdceTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "gnosis";
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Aave's USDC.e
        wrapper = IERC4626(0x51350d88c1bd32Cc6A79368c9Fb70373Fb71F375);
        // Donor of USDC.e
        underlyingDonor = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;
        amountToDonate = 1e5 * 1e6;
    }
}
