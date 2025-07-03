// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheEulerK3weWETHTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 64345152;

        // Eurler weETH
        wrapper = IERC4626(0x51b47B3013863c52CA28D603De3C2d7a5FEf50B9);
        // Donor of USDC tokens
        underlyingDonor = 0x51b47B3013863c52CA28D603De3C2d7a5FEf50B9;
        amountToDonate = 1e3 * 1e18;
    }
}
