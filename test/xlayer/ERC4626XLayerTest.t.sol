// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626XLayerTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "xlayer";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aDai
        erc4626State.wrapper = IERC4626(0x8942C1e1e0D48E14EFBa4cc48d2E3584116e367f);
        // Donor of DAI tokens
        erc4626State.underlyingDonor = 0x7EC81Ef12057008c0BB6B540127f88f917b4fC6c;
        erc4626State.amountToDonate = 1e5 * 1e6;
    }
}
