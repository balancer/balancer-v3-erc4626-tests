// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandWMONTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 55175610;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland WMON
        erc4626State.wrapper = IERC4626(0xdB39A9D4a1f1b4e93A5684d602207628aD60613C);
        // Donor of WMON
        erc4626State.underlyingDonor = 0x1d6f4d93ac7aa8574865666ab863De72129c1781;
        
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
