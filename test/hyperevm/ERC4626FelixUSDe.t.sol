// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626FelixUSDeTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "hyperevm";
        overrideBlockNumber = 8130654;

        // Felix's USDe
        wrapper = IERC4626(0x835FEBF893c6DdDee5CF762B0f8e31C5B06938ab);

        // Donor of USDe
        underlyingDonor = 0x68e37dE8d93d3496ae143F2E900490f6280C57cD;
        amountToDonate = 1e5 * 1e18;
    }
}
