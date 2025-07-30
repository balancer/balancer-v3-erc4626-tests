// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HyperbeatUSRTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 9630714;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Hyperdrive's USDe
        erc4626State.wrapper = IERC4626(0xD3A9Cb7312B9c29113290758f5ADFe12304cd16A);

        // Donor of USDe
        erc4626State.underlyingDonor = 0x09c9bcF56026283B69022D3bD5829AA3bA92538D;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
