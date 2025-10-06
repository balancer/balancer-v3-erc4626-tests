// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626PlasmaEulerUSDT0Test is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "plasma";
        forkState.blockNumber = 2827179;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Eurler USDTO
        erc4626State.wrapper = IERC4626(0xa9C251F8304b1B3Fc2b9e8fcae78D94Eff82Ac66);
        // Donor of USDTO
        erc4626State.underlyingDonor = 0x8741B106e9738a6971AD07DABCFe95FF66337b51;
        // 100M USDT0
        erc4626State.amountToDonate = 1e8 * 1e6;
    }
}
