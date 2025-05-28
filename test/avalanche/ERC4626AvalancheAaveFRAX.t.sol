// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveFRAXTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 59394164;

        // Aave's aFRAX
        wrapper = IERC4626(0x3929336Afd0BBa6FCAbB67dFB78610379C66B43B);
        // Donor of FRAX tokens
        underlyingDonor = 0x5dfF474Cea8A1FA929AC9A3cE2550376aF11d2A8;
        amountToDonate = 7e4 * 1e18;
    }
}
