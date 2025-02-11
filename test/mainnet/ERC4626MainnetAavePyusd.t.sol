// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626MainnetAavePyusdTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "mainnet";
        overrideBlockNumber = 21718082;

        // Aave's pyUSD
        wrapper = IERC4626(0xb51EDdDD8c47856D81C8681EA71404Cec93E92c6);
        // Donor of pyUSD tokens
        underlyingDonor = 0xA023f08c70A23aBc7EdFc5B6b5E171d78dFc947e;
        amountToDonate = 1e6 * 1e6;
    }
}
