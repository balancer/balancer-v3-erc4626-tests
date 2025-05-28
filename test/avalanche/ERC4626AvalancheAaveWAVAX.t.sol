// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveWAVAXTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 59394164;

        // Aave's aWAVAX
        wrapper = IERC4626(0xD7da0De6Ef4f51d6206bF2A35fCd2030F54c3F7B);
        // Donor of WAVAX tokens
        // Note: The aWAVAX token fails to mint and deposit if amountToDonate > 9e5 WAVAX tokens. (Donor has enough
        // liquidity)
        underlyingDonor = 0x6d80113e533a2C0fe82EaBD35f1875DcEA89Ea97;
        amountToDonate = 9e5 * 1e18;
    }
}
