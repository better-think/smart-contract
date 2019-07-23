pragma solidity ^0.5.0;

import "./ERCDetailed.sol";
import "./ERC20Capped.sol";
import "./access/roles/AdminRole.sol";

/**
 * @title GIXToken
 * @dev The GoldFinX ERC20 Token that can be
 * minted and is capped to a maximum allocation.
 */
contract GIXToken is ERC20Detailed, ERC20Capped, AdminRole {
    constructor () public
    ERC20Detailed("GoldFinX", "GIX", 18)
    ERC20Capped(1000000000) {

    }

    /**
     * @notice Transfers tokens held by the contract to investors.
     */
    function release(address account) public onlyAdmin {
        uint256 amount = balanceOf(account);
        require(amount > 0, "GIXToken: no tokens to release");

        transfer(account, amount);
    }
}
