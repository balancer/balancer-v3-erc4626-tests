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
        overrideBlockNumber = 21466061;

        // Aave's USDe
        wrapper = IERC4626(0x5F9D59db355b4A60501544637b00e94082cA575b);
        // Donor of USDe tokens
        underlyingDonor = 0x4dB99b79361F98865230f5702de024C69f629fEC;
        amountToDonate = 1e6 * 1e18;
    }
}
