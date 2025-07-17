// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveUSDTTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "avalanche";
        forkState.blockNumber = 59394164;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's aUSDT
        erc4626State.wrapper = IERC4626(0x59933c571d200dc6A7Fd1CDa22495dB442082E34);
        // Donor of USDT tokens
        // Note: The aUSDT token fails to mint and deposit if amountToDonate > 2e7 USDT tokens. (Donor has enough
        // liquidity)
        erc4626State.underlyingDonor = 0x5754284f345afc66a98fbB0a0Afe71e0F007B949;
        erc4626State.amountToDonate = 2e7 * 1e6;
    }
}
