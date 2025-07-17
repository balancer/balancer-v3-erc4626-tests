// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626GnosisAaveGnoTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "gnosis";
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's GNO
        erc4626State.wrapper = IERC4626(0x7c16F0185A26Db0AE7a9377f23BC18ea7ce5d644);
        // Donor of GNO
        erc4626State.underlyingDonor = 0x458cD345B4C05e8DF39d0A07220feb4Ec19F5e6f;
        erc4626State.amountToDonate = 1e4 * 1e18;
    }
}
