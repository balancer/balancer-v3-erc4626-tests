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

There are some common errors that occur when testing a token. The step-by-step guide below helps to cover most of them.

1. Navigate to the wrapped token address on Etherscan;
2. Check whether the Vault's buffer at the current block has liquidity for that token (Use the Vault Explorer's `getBufferBalance` function with the wrapped token address as the argument.)
    1. If there is, it's probably reverting because the buffer was already initialized. Choose a block number prior to the buffer initialization and try again.
        1. If the wrapper was recently created, use a block number right after the creation of the wrapper and try again.
        2. If not, try to put an old block number, closer to the Balancer V3 launch (e.g., 21332121 on Mainnet), where the Vault is already there but the buffer was not yet initialized.
3. Check the asset of the wrapped token (underlying token) and get the holders.
    1. Check whether the top holder is the one used in the test.
        1. If it's not, change the holder to the top one. It may be a bit tricky if you're using an old block number. In that case, you would need to iterate over the holders list until you find a holder with sufficient balance at that specific block.
        2. Check whether the holder we're using has enough balance to cover 3 * defaultAmount (i.e., 3e6 * 1e18 if default amount is 1e6 * 1e18).
4. Finally, if the error persists, try testing it in the [balancer-v3-monorepo](https://github.com/balancer/balancer-v3-monorepo).
   1. In your copy of that repo, go to `pkg/vault/test/foundry/fork`, then copy and modify the `ERC4626MainnetAaveUsdc.t.sol` test for your token.
   2. Run the tests specific to this file (something like `yarn test:forge --match-contract ERC4626MainnetAaveUsdcTest` inside the pkg/vault folder) and check for errors.
   3. If the tests pass, it means that the buffer is initialized at the chosen block number. The test in the monorepo uses a newly deployed Vault: this is the only reason for a test to pass in the monorepo that doesn't pass in the ERC4626 tests repo.

If the step-by-step instructions above do not help, the token is likely incompatible with the vault, and needs further investigation.

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