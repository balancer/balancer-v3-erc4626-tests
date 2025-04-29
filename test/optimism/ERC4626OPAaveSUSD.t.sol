// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OPAaveSUSDTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135133100;

        // Aave's aSUSD
        wrapper = IERC4626(0x0ec63A55a688E5Ba26afe8d9250114505E8b60a0);
        // Donor of SUSD tokens
        underlyingDonor = 0xf2107A85d8b79CBd2c5b2Bb63CA73Fd068040b67;
        amountToDonate = 1e5 * 1e18;
    }
}
