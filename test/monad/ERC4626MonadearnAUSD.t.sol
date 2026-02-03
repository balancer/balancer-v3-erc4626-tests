// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadEarnAUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 51741623;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Curvance AUSD
        erc4626State.wrapper = IERC4626(0x8E94704607E857eB3E10Bd21D90bf8C1Ecba0452);
        // Donor of AUSD
        erc4626State.underlyingDonor = 0xf33286E3222D1c829dACeac48c0Ec651F6452470;
        
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
