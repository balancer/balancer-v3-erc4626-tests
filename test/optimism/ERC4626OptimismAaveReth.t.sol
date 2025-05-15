// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveRethTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135730240;

        // Aave's aRETH
        wrapper = IERC4626(0x8e6a81b9d541A0CeA090818B62C4B2DE7f2A2Cf7);
        // Donor of rETH tokens
        underlyingDonor = 0x724dc807b04555b71ed48a6896b6F41593b8C637;
        amountToDonate = 100 * 1e18;
    }
}
