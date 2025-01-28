// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626BaseAaveUSDbCTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "base";
        overrideBlockNumber = 25630845;

        // Aave's aUSDbC
        wrapper = IERC4626(0x74D4D1D440c9679b1013999Bd91507eAa2fff651);
        // Donor of USDbC tokens
        underlyingDonor = 0xB4885Bc63399BF5518b994c1d0C153334Ee579D0;
        amountToDonate = 1e5 * 1e6;
    }
}
