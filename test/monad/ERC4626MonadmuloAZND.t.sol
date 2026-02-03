// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MonadmuloAZNDTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "monad";
        forkState.blockNumber = 53032784;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // mu loAZND
        erc4626State.wrapper = IERC4626(0x9c82eB49B51F7Dc61e22Ff347931CA32aDc6cd90);
        // Donor of AZND
        erc4626State.underlyingDonor = 0x269b47978f4348C96f521658eF452fF85906fcfe;
        
        erc4626State.amountToDonate = 1e5 * 1e18;
    }
}
