// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OptimismAaveUSDCTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 135730240;

        // Aave's aUSDC
        wrapper = IERC4626(0x41B334E9F2C0ED1f30fD7c351874a6071C53a78E);
        // Donor of USDC tokens
        underlyingDonor = 0xf89d7b9c864f589bbF53a82105107622B35EaA40;
        amountToDonate = 1e6 * 1e6;
    }
}
