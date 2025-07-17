// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAavePyusdTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "mainnet";
        forkState.blockNumber = 21718082;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave's pyUSD
        erc4626State.wrapper = IERC4626(0xb51EDdDD8c47856D81C8681EA71404Cec93E92c6);
        // Donor of pyUSD tokens
        erc4626State.underlyingDonor = 0xA023f08c70A23aBc7EdFc5B6b5E171d78dFc947e;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
