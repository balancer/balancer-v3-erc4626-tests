// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626VicunaVaultSTS is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 15814743;

        // Vicuna STS vault
        wrapper = IERC4626(0xdB1E39faC2EeeEdB49198735B12a8e598a84510c);
        // Donor of STS
        underlyingDonor = 0x396922EF30Cf012973343f7174db850c7D265278;
        amountToDonate = 1e4 * 1e18;
    }
}
