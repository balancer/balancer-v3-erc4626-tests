// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626SonicAaveUsdcTest is ERC4626WrapperBaseTest {
    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "sonic";
        forkState.blockNumber = 13405152;
    }

    function _setUpForkTestVariables() internal pure override returns (ERC4626SetupState memory erc4626State) {
        // Aave USDCE
        erc4626State.wrapper = IERC4626(0x6646248971427B80ce531bdD793e2Eb859347E55);
        // Donor of USDCE
        erc4626State.underlyingDonor = 0x322e1d5384aa4ED66AeCa770B95686271de61dc3;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }
}
