// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadneverlandloAZNDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 55175610;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Neverland loAZND
        erc4626State.wrapper = IERC4626(0xD786F7569C39A9F64E6A54Eb77db21364E90F279);
        // Donor of loAZND
        erc4626State.underlyingDonor = 0x567713Ae76857Ecd5F5A1AC0D7EEfED6CebB4AD9;
        
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
