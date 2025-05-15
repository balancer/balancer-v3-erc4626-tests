// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveWstETHTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135730240;

        // Aave's aWSTETH
        wrapper = IERC4626(0xbaF95bB30CDab3d5b7a11B67EDeF5631bD62be86);
        // Donor of WSTETH tokens
        underlyingDonor = 0xc45A479877e1e9Dfe9FcD4056c699575a1045dAA;
        amountToDonate = 1000 * 1e18;
    }
}
