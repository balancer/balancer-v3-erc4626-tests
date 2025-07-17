// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveAAVETest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aAAVE
        erc4626State.wrapper = IERC4626(0x7883978D1F322641a3AaA82Bac3b0a6Dee7A171E);
        // Donor of AAVE tokens
        // Note: The aAAVE token fails to mint and deposit if amountToDonate > 981 AAVE tokens. (Donor has enough
        // liquidity)
        erc4626State.underlyingDonor = 0xf329e36C7bF6E5E86ce2150875a84Ce77f477375;
        erc4626State.amountToDonate = 981 * 1e18;
    }
}
