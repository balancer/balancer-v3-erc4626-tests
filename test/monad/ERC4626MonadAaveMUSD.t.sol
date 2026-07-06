// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadAaveMUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 85383178;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave Monad mUSD
        erc4626State.wrapper = IERC4626(0x6A7C826974994c4CE012B2fb32FE9D30d6366380);
        // Donor of mUSD
        erc4626State.underlyingDonor = 0xf70da97812CB96acDF810712Aa562db8dfA3dbEF;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
