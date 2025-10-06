// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626PlasmaAaveUSDT0Test is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "plasma";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's waUSDT0
        erc4626State.wrapper = IERC4626(0xE0126F0c4451B2B917064A93040fd4770D6774b5);
        // Donor of USDT0
        erc4626State.underlyingDonor = 0xd1074E0AE85610dDBA0147e29eBe0D8E5873a000;
        erc4626State.amountToDonate = 10e3 * 1e6;
    }
}
