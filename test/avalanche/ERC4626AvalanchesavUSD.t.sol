// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalanchesavUSDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // savUSD
        erc4626State.wrapper = IERC4626(0x06d47F3fb376649c3A9Dafe069B3D6E35572219E);
        // Donor of avUSD tokens
        erc4626State.underlyingDonor = 0xb768091A8e6FFCdc215767937Bd9fb039CB06577;
        
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
