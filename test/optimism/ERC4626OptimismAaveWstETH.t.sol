// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveWstETHTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "optimism";
        forkState.blockNumber = 135730240;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aWSTETH
        erc4626State.wrapper = IERC4626(0xbaF95bB30CDab3d5b7a11B67EDeF5631bD62be86);
        // Donor of WSTETH tokens
        erc4626State.underlyingDonor = 0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA;
        erc4626State.amountToDonate = 1000 * 1e18;
    }
}
