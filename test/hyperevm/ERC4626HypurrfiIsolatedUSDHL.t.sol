// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HypurrfiIsolatedUSDHLTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 8421898;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Hypurrfi's USDHL
        erc4626State.wrapper = IERC4626(0xe8648B00570B5562488d8324c98242EE8FB1A35F);

        // Donor of USDHL
        erc4626State.underlyingDonor = 0x2000000000000000000000000000000000000123;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
