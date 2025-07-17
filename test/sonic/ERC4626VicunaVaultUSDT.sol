// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626VicunaVaultUSDT is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 15814743;

        // Vicuna USDT vault
        erc4626State.wrapper = IERC4626(0xd7c9f62622dB85545731F0E4e5D4556aC8a19832);
        // Donor of USDT
        erc4626State.underlyingDonor = 0x0d13400CC7c46D77a43957fE614ba58C827dfde6;
        erc4626State.amountToDonate = 1e4 * 1e6;
    }
}
