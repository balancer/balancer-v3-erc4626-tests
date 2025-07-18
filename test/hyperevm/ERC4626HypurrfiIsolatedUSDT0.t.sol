// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HypurrfiIsolatedUSDT0Test is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 8421898;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Hypurrfi's USDT0
        erc4626State.wrapper = IERC4626(0x2c910F67DbF81099e6f8e126E7265d7595DC20aD);

        // Donor of USDT0
        erc4626State.underlyingDonor = 0x337b56d87A6185cD46AF3Ac2cDF03CBC37070C30;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
