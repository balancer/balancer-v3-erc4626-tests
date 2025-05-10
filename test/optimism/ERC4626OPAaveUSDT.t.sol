// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626OPAaveUSDTTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "optimism";
        overrideBlockNumber = 133969620;

        // Aave's aUSDT
        wrapper = IERC4626(0x927CfF131fD5B43FC992D071929b2c095d6E4b70);
        // Donor of USDT tokens
        underlyingDonor = 0xf89d7b9c864f589bbF53a82105107622B35EaA40;
        amountToDonate = 1e5 * 1e6;
    }
}
