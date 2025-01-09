// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAaveUsdeTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";
        //overrideBlockNumber = 21537026;

        // Aave's USDe
        wrapper = IERC4626(0x5F9D59db355b4A60501544637b00e94082cA575b);
        // Donor of USDe tokens
        underlyingDonor = 0xA7A93fd0a276fc1C0197a5B5623eD117786eeD06;
        amountToDonate = 1e6 * 1e18;
    }
}
