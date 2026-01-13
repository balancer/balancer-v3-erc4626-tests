// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626PlasmasyzUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "plasma";
        forkState.blockNumber = 11383286;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // syzUSD
        erc4626State.wrapper = IERC4626(0xC8A8DF9B210243c55D31c73090F06787aD0A1Bf6);
        // Donor of ysUSD
        erc4626State.underlyingDonor = 0xC8A8DF9B210243c55D31c73090F06787aD0A1Bf6;
        
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
