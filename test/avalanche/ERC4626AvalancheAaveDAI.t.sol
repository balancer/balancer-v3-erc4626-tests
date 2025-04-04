// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveDAITest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 59394164;

        // Aave's aDAI
        wrapper = IERC4626(0xC38aD3527A4B821BF437639cBA8Bf567BFa63A13);
        // Donor of DAI tokens
        underlyingDonor = 0x835866d37AFB8CB8F8334dCCdaf66cf01832Ff5D;
        amountToDonate = 10000 * 1e18;
    }
}
