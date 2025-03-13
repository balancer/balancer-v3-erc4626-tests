// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAvalonUSDaTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 11804781;

        // Avalon USDa
        wrapper = IERC4626(0xB97af8cbD08d182Cc118439ff5d4b547ec16258C);
        // Donor of USDa
        underlyingDonor = 0x9d703fe0324fE009B55e8837F88B4BC131ef77Ad;
        amountToDonate = 10 * 1e18;
    }
}
