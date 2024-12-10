# Balancer V3 ERC4626 Fork Tests

This repository contains tests to make sure an ERC4626 token is supported by Balancer V3 buffers.
To be supported, an ERC4626 token must have the following properties:

* Implement all functions from the standard ERC-4626: Tokenized Vaults. The tests will make sure that the following 
functions are correctly implemented: `asset`, `convertToAssets`, `convertToShares`,`previewDeposit`, `previewMint`,
`previewWithdraw`, `previewRedeem`, `deposit`, `mint`, `withdraw`, `redeem`;
* `convert` functions and `preview` functions must have a close result, with a maximum of 1 wei difference;
* The ERC4626 wrapper should not have a deposit or withdraw fee. If a deposit of `amount` is made, the user should be 
able to withdraw `amount - 1`;
* `preview` and actual operation should match perfectly;
* `deposit` and `redeem` should be EXACT_IN functions. It means, it should take the exact amount of
tokens passed as argument;
* `mint` and `withdraw` should be EXACT_OUT functions. It means, it should return to the user the
exact amount of tokens as the number returned by the function execution.