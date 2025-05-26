// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveAaveTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135730595;

        // Aave's aAAVE
        wrapper = IERC4626(0x527604E4D87A7562ec653dbe2878D0DCAB7f1972);
        // Donor of AAVE tokens
        underlyingDonor = 0xf329e36C7bF6E5E86ce2150875a84Ce77f477375;
        amountToDonate = 1000 * 1e18;
    }
}
