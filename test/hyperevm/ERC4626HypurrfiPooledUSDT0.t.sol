// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { TransparentProxyFactory } from "solidity-utils/contracts/transparent-proxy/TransparentProxyFactory.sol";
import { IRewardsController } from "aave-v3-periphery/contracts/rewards/interfaces/IRewardsController.sol";
import { StaticATokenFactory } from "@static-a-token-v3/StaticATokenFactory.sol";
import { StaticATokenLM } from "@static-a-token-v3/StaticATokenLM.sol";
import { IPool } from "aave-v3-core/contracts/interfaces/IPool.sol";

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { ERC4626WrapperBaseTest } from "../ERC4626WrapperBase.t.sol";
import { PoolStorageMock } from "./test/PoolStorageMock.sol";

contract ERC4626HypurrfiPooledUSDT0Test is ERC4626WrapperBaseTest {
    function setUp() public override {
        ERC4626WrapperBaseTest.setUp();
    }

    function setUpForkTestVariables() internal override {
        network = "hyperevm";
        overrideBlockNumber = 8486200;

        // Hypurrfi's Pooled USDT0
        address wrapperAddress = deployStatAToken(address(0xB8CE59FC3717ada4C02eaDF9682A9e934F625ebb));
        wrapper = IERC4626(wrapperAddress);

        // Donor of USDT0
        underlyingDonor = 0x337b56d87A6185cD46AF3Ac2cDF03CBC37070C30;
        amountToDonate = 1e6 * 1e6;
    }

    function deployStatAToken(address underlying) internal returns (address) {
        IPool pool = IPool(0x980BDd9cF1346800F6307E3B2301fFd3ce8C7523); //IPool(0xceCcE0EB9DD2Ef7996e01e25DD70e461F918A14b);
        vm.etch(address(pool), address(new PoolStorageMock()).code);
        vm.etch(address(underlying), address(new PoolStorageMock()).code);
        PoolStorageMock(address(pool)).logStorage(0, 500);
        console2.log("reserveData.aTokenAddress", pool.getReserveData(underlying).aTokenAddress);
        StaticATokenLM statATokenImplementation = new StaticATokenLM(
            pool,
            IRewardsController(0x0000000000000000000000000000000000000000)
        );
        TransparentProxyFactory proxyFactory = new TransparentProxyFactory();
        StaticATokenFactory staticAFactory = new StaticATokenFactory(
            pool,
            address(0),
            proxyFactory,
            address(statATokenImplementation)
        );

        address[] memory underlyings = new address[](1);
        underlyings[0] = underlying;
        address[] memory statATokens = staticAFactory.createStaticATokens(underlyings);

        return statATokens[0];
    }
}
