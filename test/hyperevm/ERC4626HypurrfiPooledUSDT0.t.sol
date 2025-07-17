// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { TransparentProxyFactory } from "solidity-utils/contracts/transparent-proxy/TransparentProxyFactory.sol";
import { IRewardsController } from "aave-v3-periphery/contracts/rewards/interfaces/IRewardsController.sol";
import { StaticATokenFactory } from "@static-a-token-v3/StaticATokenFactory.sol";
import { StaticATokenLM } from "@static-a-token-v3/StaticATokenLM.sol";
import { IPool } from "aave-v3-core/contracts/interfaces/IPool.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest, ERC4626SetupState, ForkState } from "../ERC4626WrapperBase.t.sol";

contract ERC4626HypurrfiPooledUSDT0Test is ERC4626WrapperBaseTest {
    // This is the pool that contains the mapping of underlying and aTokens (the pooled market is a fork of Aave).
    address private constant HYPURRFI_POOL_ADDRESS = 0xceCcE0EB9DD2Ef7996e01e25DD70e461F918A14b;
    // Other tests require only the wrapped token address. Since we're creating the static a token, we need to
    // know the underlying token.
    address private constant USDT0_ADDRESS = 0xB8CE59FC3717ada4C02eaDF9682A9e934F625ebb;

    function _setupFork() internal pure override returns (ForkState memory forkState) {
        // Notice that when executing this function, the fork has not yet been created, so all chain states are empty.
        forkState.network = "hyperevm";
        forkState.blockNumber = 8486200;
    }

    function _setUpForkTestVariables() internal override returns (ERC4626SetupState memory erc4626State) {
        // Pooled tokens are a fork of Aave. So, they don't support EIP-4626 natively. We need, then, to deploy a
        // staticAToken before testing the token. Notice that the aToken already exists. the StaticATokenFactory
        // will just create a staticAToken that points to the existing aToken, and then it'll be compatible with
        // ERC4626.
        address wrapperAddress = _deployStaticAToken(USDT0_ADDRESS);
        // Hypurrfi's Pooled USDT0
        erc4626State.wrapper = IERC4626(wrapperAddress);

        // Donor of USDT0
        erc4626State.underlyingDonor = 0x337b56d87A6185cD46AF3Ac2cDF03CBC37070C30;
        erc4626State.amountToDonate = 1e6 * 1e6;
    }

    function _deployStaticAToken(address underlying) private returns (address) {
        IPool pool = IPool(HYPURRFI_POOL_ADDRESS);
        StaticATokenLM statATokenImplementation = new StaticATokenLM(pool, IRewardsController(address(0)));
        TransparentProxyFactory proxyFactory = new TransparentProxyFactory();
        StaticATokenFactory staticAFactory = new StaticATokenFactory(
            pool,
            address(123), // Proxy admin, any address will do but address(0)
            proxyFactory,
            address(statATokenImplementation)
        );

        address[] memory underlyings = new address[](1);
        underlyings[0] = underlying;
        address[] memory statATokens = staticAFactory.createStaticATokens(underlyings);

        return statATokens[0];
    }
}
