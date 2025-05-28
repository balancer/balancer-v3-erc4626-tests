// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveSUSDTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135729365;

        // Aave's sUSD
        wrapper = IERC4626(0x0ec63A55a688E5Ba26afe8d9250114505E8b60a0);
        // Donor of sUSD tokens
        underlyingDonor = 0xFa1DF09D8d09D6E8FAB2a6C4712fEa02ce203e99;
        amountToDonate = 1000 * 1e18;
    }
}
