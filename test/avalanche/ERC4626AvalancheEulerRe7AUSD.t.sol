// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheEulerRe7AUSDTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 59394164;

        // Euler AUSD
        wrapper = IERC4626(0x2137568666f12fc5A026f5430Ae7194F1C1362aB);
        // Donor of AUSD tokens
        underlyingDonor = 0x190D94613A09ad7931FcD17CD6A8F9B6B47ad414;
        amountToDonate = 10000 * 1e6;
    }
}
