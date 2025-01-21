# Balancer V3 ERC4626 Fork Tests

This repository contains tests to ensure that an ERC4626 token is compatible with Balancer V3 buffers. For 
compatibility, an ERC4626 token must meet the following requirements:

### Full ERC4626 Compliance  

The token must implement all functions defined by the 
[ERC-4626: Tokenized Vaults](https://eips.ethereum.org/EIPS/eip-4626) standard. The tests validate the correct 
implementation of the following functions:

- `asset`
- `convertToAssets`
- `convertToShares`
- `previewDeposit`
- `previewMint`
- `previewWithdraw`
- `previewRedeem`
- `deposit`
- `mint`
- `withdraw`
- `redeem`

### Debug failing tests

There are some common errors that may occur when testing a token. The step-by-step below helps to cover most of them.

1. Get the wrapped token address, go to etherscan;
2. Check if the vault's buffer, in the current block, has liquidity for that token (Use vault explorer's `getBufferBalance` using the wrapped token address as argument to check the liquidity)
    1. If there is, it's probably reverting because the buffer is already initialized. Choose a block number prior to the buffer initialization and try again;
        1. If the wrapper was recently created, put a block number right after the creation of the wrapper and test again;
        2. If not, try to put an old block number, closer to Balancer V3 release, where the vault is already there but the buffer is not initialized;
3. Check the asset of the wrapped token (underlying token) and get the holders;
    1. Check if the top holder is the one used in the test;
        1. If it's not, change the holder to the top one (it may be a bit tricky if we're using an old block number, then you probably need to iterate over the holders list until you find a holder with balance in that specific block number)
        2. Check if the holder we're using has enough balance to cover 3 * defaultAmount. It means, if default amount is 1e6 * 1e18, the holder must have at least 3e6 * 1e18 assets;
4. Finally, if the error persists, it needs to be tested in [balancer-v3-monorepo](https://github.com/balancer/balancer-v3-monorepo);
   1. In that project, go to `pkg/vault/test/foundry/fork` and copy the test `ERC4626MainnetAaveUsdc.t.sol` (or modify it);
   2. Run the test specifically for this file (something like `yarn test:forge --match-contract ERC4626MainnetAaveUsdcTest` inside the vault pkg folder) and check the error;
   3. If the test passes, it means that the buffer is initialized in the chosen block number (the test in the monorepo uses a clean vault, and this is the only reason for a test to pass in the monorepo and don't pass in this ERC4626 tests repo);

If the step-by-step above does not help, probably the token is incompatible with the vault and need further investigation.

### No Deposit or Withdraw Fees

The ERC4626 wrapper should not impose deposit or withdrawal fees. For example, a deposit of `amount` tokens should 
allow the user to withdraw at least `amount - 1` tokens.

### Accurate Conversions

The `convert` and `preview` functions must produce results that are close, with a maximum allowable difference of 1 wei.

### Preview and Operation Consistency 

The results of `preview` functions must match the outcomes of their corresponding operations precisely.

### Exact-Input for Deposit and Redeem

The `deposit` and `redeem` functions must behave as **EXACT_IN** functions, consuming the exact amount of tokens specified in their input arguments.

### Exact-Output for Mint and Withdraw

The `mint` and `withdraw` functions must behave as **EXACT_OUT** functions, returning the exact number of tokens specified in their output values.

### Flashloan Incompatibility

In terms of all ERC4626 vaults, there is an [inherent incompatibility](https://docs.morpho.org/morpho-vaults/tutorials/vault-token-asset/) related to flash loans. When an ERC4626 is deposited into a contract that can be flashloaned, an issue arises where a user can frontrun bad debt socialization by flashloaning the shares and then withdrawing them, which amplifies the bad debt. This is limited by the amount available to flashloan AND withdrawable liquidity in the pool.