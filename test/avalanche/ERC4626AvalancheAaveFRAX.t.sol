// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveFRAXTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aFRAX
        erc4626State.wrapper = IERC4626(0x3929336Afd0BBa6FCAbB67dFB78610379C66B43B);
        // Donor of FRAX tokens
        erc4626State.underlyingDonor = 0x5dfF474Cea8A1FA929AC9A3cE2550376aF11d2A8;
        erc4626State.amountToDonate = 7e4 * 1e18;
    }
}
