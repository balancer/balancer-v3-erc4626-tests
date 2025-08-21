// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HypurrfistathyUSDT0Test is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 11118800;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Hypurrfi's USDT0
        erc4626State.wrapper = IERC4626(0xDC6F4239C1D8D3b955C06CB8f1A6cF18EFfc5BFe);

        // Donor of USDT0
        erc4626State.underlyingDonor = 0x68e37dE8d93d3496ae143F2E900490f6280C57cD;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
