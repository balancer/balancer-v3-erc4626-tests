// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveAAVETest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 59394164;

        // Aave's aAAVE
        wrapper = IERC4626(0x7883978D1F322641a3AaA82Bac3b0a6Dee7A171E);
        // Donor of AAVE tokens
        // Note: The aAAVE token fails to mint and deposit if amountToDonate > 981 AAVE tokens. (Donor has enough
        // liquidity)
        underlyingDonor = 0xf329e36C7bF6E5E86ce2150875a84Ce77f477375;
        amountToDonate = 981 * 1e18;
    }
}
