// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HypurrfiIsolatedUSDT0Test is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "hyperevm";
        overrideBlockNumber = 8421898;

        // Hypurrfi's USDT0
        wrapper = IERC4626(0x2c910F67DbF81099e6f8e126E7265d7595DC20aD);

        // Donor of USDT0
        underlyingDonor = 0x337b56d87A6185cD46AF3Ac2cDF03CBC37070C30;
        amountToDonate = 1e6 * 1e6;
    }
}
