# Balancer V3 ERC4626 Fork Tests

This repository contains tests to ensure that an ERC4626 token is compatible with Balancer V3 buffers. For 
compatibility, an ERC4626 token must meet the following requirements:

## Requirements

1. **Full ERC4626 Compliance**  
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

2. **No Deposit or Withdraw Fees**  
   The ERC4626 wrapper should not impose deposit or withdrawal fees. For example:
    - A deposit of `amount` tokens should allow the user to withdraw at least `amount - 1` tokens.

3. **Accurate Conversions**  
   The `convert` and `preview` functions must produce results that are close, with a maximum allowable difference of 1 wei.

4. **Preview and Operation Consistency**  
   The results of `preview` functions must match the outcomes of their corresponding operations precisely.

5. **Exact-Input for Deposit and Redeem**
    - The `deposit` and `redeem` functions must behave as **EXACT_IN** functions, consuming the exact amount of tokens specified in their input arguments.

6. **Exact-Output for Mint and Withdraw**
    - The `mint` and `withdraw` functions must behave as **EXACT_OUT** functions, returning the exact number of tokens specified in their output values.

---

This suite of tests ensures ERC4626 tokens integrate seamlessly with Balancer V3 buffers, maintaining high standards for precision and compatibility.