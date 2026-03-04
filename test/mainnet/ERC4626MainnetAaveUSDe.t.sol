// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaveUsdeTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 21466061;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's USDe
        erc4626State.wrapper = IERC4626(0x5F9D59db355b4A60501544637b00e94082cA575b);
        // Donor of USDe tokens
        erc4626State.underlyingDonor = 0x4dB99b79361F98865230f5702de024C69f629fEC;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
