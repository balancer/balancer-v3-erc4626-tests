// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveDAITest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aDAI
        erc4626State.wrapper = IERC4626(0xC38aD3527A4B821BF437639cBA8Bf567BFa63A13);
        // Donor of DAI tokens
        erc4626State.underlyingDonor = 0x835866d37AFB8CB8F8334dCCdaf66cf01832Ff5D;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
