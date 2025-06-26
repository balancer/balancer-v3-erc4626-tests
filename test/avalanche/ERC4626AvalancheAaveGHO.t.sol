// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveGHOTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 64506494;

        // Aave's aGHO
        wrapper = IERC4626(0x79459f4C9AfC902488109D058C3E76ed0B037c41);
        // Donor of GHO tokens
        underlyingDonor = 0xf611aEb5013fD2c0511c9CD55c7dc5C1140741A6;
        amountToDonate = 10 * 1e18;
    }
}
