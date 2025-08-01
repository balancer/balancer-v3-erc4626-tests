// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveAaveTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 135730595;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aAAVE
        erc4626State.wrapper = IERC4626(0x527604E4D87A7562ec653dbe2878D0DCAB7f1972);
        // Donor of AAVE tokens
        erc4626State.underlyingDonor = 0xf329e36C7bF6E5E86ce2150875a84Ce77f477375;
        erc4626State.amountToDonate = 1000 * 1e18;
    }
}
