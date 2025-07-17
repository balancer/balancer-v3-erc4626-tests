// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheEulerK3weWETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 64345152;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Eurler weETH
        erc4626State.wrapper = IERC4626(0x51b47B3013863c52CA28D603De3C2d7a5FEf50B9);
        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0x51b47B3013863c52CA28D603De3C2d7a5FEf50B9;
        erc4626State.amountToDonate = 1e3 * 1e18;
    }
}
