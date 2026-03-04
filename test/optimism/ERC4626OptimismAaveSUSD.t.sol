// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveSUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 135729365;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's sUSD
        erc4626State.wrapper = IERC4626(0x0ec63A55a688E5Ba26afe8d9250114505E8b60a0);
        // Donor of sUSD tokens
        erc4626State.underlyingDonor = 0xFa1DF09D8d09D6E8FAB2a6C4712fEa02ce203e99;
        erc4626State.amountToDonate = 1000 * 1e18;
    }
}
