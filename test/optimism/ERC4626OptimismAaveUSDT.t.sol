// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveUSDTTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 133970000;
    }

    function _setUpForkTestVariables()
        internal
        pure
        override
        returns (IERC4626 wrapper, address underlyingDonor, uint256 amountToDonate, uint256)
    {
        // Aave's aUSDT
        wrapper = IERC4626(0x927CfF131fD5B43FC992D071929b2c095d6E4b70);
        // Donor of USDT tokens
        underlyingDonor = 0xf89d7b9c864f589bbF53a82105107622B35EaA40;
        amountToDonate = 1e6 * 1e6;
    }
}
