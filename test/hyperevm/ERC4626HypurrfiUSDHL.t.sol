// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HypurrfiUSDHLTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "hyperevm";
        overrideBlockNumber = 8421898;

        // Hypurrfi's USDHL
        wrapper = IERC4626(0xe8648B00570B5562488d8324c98242EE8FB1A35F);

        // Donor of USDHL
        underlyingDonor = 0x2000000000000000000000000000000000000123;
        amountToDonate = 1e6 * 1e6;
    }
}
