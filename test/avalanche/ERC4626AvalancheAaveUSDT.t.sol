// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626AvalancheAaveUSDTTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "avalanche";
        overrideBlockNumber = 59394164;

        // Aave's aUSDT
        wrapper = IERC4626(0x59933c571d200dc6A7Fd1CDa22495dB442082E34);
        // Donor of USDT tokens
        underlyingDonor = 0x4aeFa39caEAdD662aE31ab0CE7c8C2c9c0a013E8;
        amountToDonate = 10000 * 1e6;
    }
}
