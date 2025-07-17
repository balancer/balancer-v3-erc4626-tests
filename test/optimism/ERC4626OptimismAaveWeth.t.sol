// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveWethTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 133970000;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aWETH
        erc4626State.wrapper = IERC4626(0x464b808c2C7E04b07e860fDF7a91870620246148);
        // Donor of WETH tokens
        erc4626State.underlyingDonor = 0x86Bb63148d17d445Ed5398ef26Aa05Bf76dD5b59;
        erc4626State.amountToDonate = 500 * 1e18;
    }
}
