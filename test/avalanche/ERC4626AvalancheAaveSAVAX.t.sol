// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveSAVAXTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 59394164;

        // Aave's aSAVAX
        wrapper = IERC4626(0x7D0394F8898fBA73836Bf12bD606228887705895);
        // Donor of SAVAX tokens
        underlyingDonor = 0xF362feA9659cf036792c9cb02f8ff8198E21B4cB;
        amountToDonate = 1e5 * 1e18;
    }
}
