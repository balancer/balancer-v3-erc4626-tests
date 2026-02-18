// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";
import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetMorphoKpkUsdcYield is ERC4626WrapperBaseTest {
    
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        forkState.network = "mainnet";
        forkState.blockNumber = 24482976; 
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Morpho's kpk USDC Yield V2
        erc4626State.wrapper = IERC4626(0xD5cCe260E7a755DDf0Fb9cdF06443d593AaeaA13);

        // Donor of USDC tokens
        erc4626State.underlyingDonor = 0x37305B1cD40574E4C5Ce33f8e8306Be057fD7341;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}