// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626ArbitrumAaveWBTC is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "arbitrum";
        forkState.blockNumber = 300110427;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aWBTC
        erc4626State.wrapper = IERC4626(0x52Dc1FEeFA4f9a99221F93D79da46Ae89b8c0967);
        // Donor of WBTC tokens
        erc4626State.underlyingDonor = 0x7C11F78Ce78768518D743E81Fdfa2F860C6b9A77;
        erc4626State.amountToDonate = 50 * 1e8;
    }
}
