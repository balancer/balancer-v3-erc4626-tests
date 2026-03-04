// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626EulerMEVscETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 10486777;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Euler scETH vault in MEV-Capital cluster
        erc4626State.wrapper = IERC4626(0x0806af1762Bdd85B167825ab1a64E31CF9497038);
        // Donor of scETH
        erc4626State.underlyingDonor = 0x455d5f11Fea33A8fa9D3e285930b478B6bF85265;
        erc4626State.amountToDonate = 50 * 1e18;
    }
}
