// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OPAaveUSDCnTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135132700;

        // Aave's aUSDCn
        wrapper = IERC4626(0x41B334E9F2C0ED1f30fD7c351874a6071C53a78E);
        // Donor of USDCn tokens
        underlyingDonor = 0xcE8CcA271Ebc0533920C83d39F417ED6A0abB7D0;
        amountToDonate = 1e5 * 1e6;
    }
}
