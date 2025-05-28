// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAaveUsdcTest is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "sonic";
        overrideBlockNumber = 13405152;

        // Aave USDCE
        wrapper = IERC4626(0x6646248971427B80ce531bdD793e2Eb859347E55);
        // Donor of USDCE
        underlyingDonor = 0x322e1d5384aa4ED66AeCa770B95686271de61dc3;
        amountToDonate = 1e6 * 1e6;
    }
}
