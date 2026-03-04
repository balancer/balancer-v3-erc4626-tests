// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SepoliaAaveDaiTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sepolia";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's static aDAI
        erc4626State.wrapper = IERC4626(0xDE46e43F46ff74A23a65EBb0580cbe3dFE684a17);
        // Donor of DAI tokens
        erc4626State.underlyingDonor = 0x4d02aF17A29cdA77416A1F60Eae9092BB6d9c026;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
