// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveLINKTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 59394164;

        // Aave's aLINK
        wrapper = IERC4626(0x61933AF56431280EE4e5667133D8aF6322D64B32);
        // Donor of LINK tokens
        underlyingDonor = 0x4e9f683A27a6BdAD3FC2764003759277e93696e6;
        amountToDonate = 10000 * 1e18;
    }
}
