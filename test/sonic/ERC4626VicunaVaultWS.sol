// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626VicunaVaultWS is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 15814743;

        // Vicuna WS vault
        erc4626State.wrapper = IERC4626(0x6C2dadFfAB1714485aD87d1926f4c26E29a957b6);
        // Donor of WS
        erc4626State.underlyingDonor = 0x6C5E14A212c1C3e4Baf6f871ac9B1a969918c131;
        erc4626State.amountToDonate = 1e6 * 1e18;
    }
}
