// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626VicunaVaultUSDT is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 15814743;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Vicuna USDT vault
        erc4626State.wrapper = IERC4626(0xd7c9f62622dB85545731F0E4e5D4556aC8a19832);
        // Donor of USDT
        erc4626State.underlyingDonor = 0x0d13400CC7c46D77a43957fE614ba58C827dfde6;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
