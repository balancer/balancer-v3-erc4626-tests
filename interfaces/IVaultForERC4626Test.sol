// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

/// @notice Simplified version of the IVault, specific to the wrapper's tests.
interface IVaultForERC4626Test {
    /**
     * @notice Removes liquidity from an internal ERC4626 buffer in the Vault.
     * @dev Only proportional exits are supported, and the sender has to be the owner of the shares.
     * This function unlocks the Vault just for this operation; it does not work with a Router as an entrypoint.
     *
     * Pre-conditions:
     * - The buffer needs to be initialized.
     * - sharesOwner is the original msg.sender, it needs to be checked in the Router. That's why
     *   this call is authenticated; only routers approved by the DAO can remove the liquidity of a buffer.
     * - The buffer needs to have some liquidity and have its asset registered in `_bufferAssets` storage.
     *
     * @param wrappedToken Address of the wrapped token that implements IERC4626
     * @param sharesToRemove Amount of shares to remove from the buffer. Cannot be greater than sharesOwner's
     * total shares. It is expressed in underlying token native decimals
     * @param minAmountUnderlyingOutRaw Minimum amount of underlying tokens to receive from the buffer. It is expressed
     * in underlying token native decimals
     * @param minAmountWrappedOutRaw Minimum amount of wrapped tokens to receive from the buffer. It is expressed in
     * wrapped token native decimals
     * @return removedUnderlyingBalanceRaw Amount of underlying tokens returned to the user
     * @return removedWrappedBalanceRaw Amount of wrapped tokens returned to the user
     */
    function removeLiquidityFromBuffer(
        IERC4626 wrappedToken,
        uint256 sharesToRemove,
        uint256 minAmountUnderlyingOutRaw,
        uint256 minAmountWrappedOutRaw
    ) external returns (uint256 removedUnderlyingBalanceRaw, uint256 removedWrappedBalanceRaw);

    /**
     * @notice Returns the supply shares (internal buffer BPT) of the ERC4626 buffer.
     * @param wrappedToken Address of the wrapped token that implements IERC4626
     * @return bufferShares Amount of supply shares of the buffer, in native underlying token decimals
     */
    function getBufferTotalShares(IERC4626 wrappedToken) external view returns (uint256 bufferShares);
}