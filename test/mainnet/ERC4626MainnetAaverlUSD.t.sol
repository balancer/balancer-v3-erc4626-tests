// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaverlUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 22439030;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's rlUSD
        erc4626State.wrapper = IERC4626(0x6A1792a91C08e9f0bFe7a990871B786643237f0F);
        // Donor of WETH tokens
        erc4626State.underlyingDonor = 0xFa82580c16A31D0c1bC632A36F82e83EfEF3Eec0;
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
