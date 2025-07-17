// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveWAVAXTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aWAVAX
        erc4626State.wrapper = IERC4626(0xD7da0De6Ef4f51d6206bF2A35fCd2030F54c3F7B);
        // Donor of WAVAX tokens
        // Note: The aWAVAX token fails to mint and deposit if amountToDonate > 9e5 WAVAX tokens. (Donor has enough
        // liquidity)
        erc4626State.underlyingDonor = 0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97;
        erc4626State.amountToDonate = 9e5 * 1e18;
    }
}
