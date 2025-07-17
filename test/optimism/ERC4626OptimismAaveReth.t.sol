// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveRethTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 135730240;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aRETH
        erc4626State.wrapper = IERC4626(0x8e6a81b9d541A0CeA090818B62C4B2DE7f2A2Cf7);
        // Donor of rETH tokens
        erc4626State.underlyingDonor = 0x724dc807b04555b71ed48a6896b6F41593b8C637;
        erc4626State.amountToDonate = 100 * 1e18;
    }
}
