// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveDAITest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135729365;

        // Aave's aDAI
        wrapper = IERC4626(0x61b620FAd391b53A2D0973b10a3Ed69558d5c66E);
        // Donor of DAI tokens
        underlyingDonor = 0x1eED63EfBA5f81D95bfe37d82C8E736b974F477b;
        amountToDonate = 1e6 * 1e18;
    }
}
