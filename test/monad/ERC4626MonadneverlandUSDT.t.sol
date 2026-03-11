// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandUSDTTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 55175610;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland USDT
        erc4626State.wrapper = IERC4626(0x4e8aaecCE10ad9394e96fE5f2bd4e587A7B04298);
        // Donor of USDT
        erc4626State.underlyingDonor = 0x942644106B073E30D72c2C5D7529D5C296ea91ab;
        
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
