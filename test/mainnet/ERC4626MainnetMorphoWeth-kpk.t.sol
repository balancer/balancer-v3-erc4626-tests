// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoWethkpkTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 23897761;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Morpho's kpk WETH
        erc4626State.wrapper = IERC4626(0xBb50A5341368751024ddf33385BA8cf61fE65FF9);
        // Donor of WETH tokens
        erc4626State.underlyingDonor = 0x4d5F47FA6A74757f35C14fD3a6Ef8E3C9BC514E8;
        erc4626State.amountToDonate = 1e3 * 1e18;
    }
}
