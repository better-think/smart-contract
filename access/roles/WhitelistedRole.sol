pragma solidity ^0.5.0;

import "../Roles.sol";

contract WhitelistedRole {
    using Roles for Roles.Role;

    event WhitelistedAdded(address indexed account);
    event WhitelistedRemoved(address indexed account);

    Roles.Role private _whitelisteds;

    constructor () internal {
        _addWhitelisted(msg.sender);
    }

    modifier onlyWhitelisted() {
        require(isWhitelisted(msg.sender), "WhitelistedRole: this account isn't whitelisted");
        _;
    }

    function isWhitelisted(address account) public view returns (bool) {
        return _whitelisteds.has(account);
    }

    function _addWhitelisted(address account) internal {
        _whitelisteds.add(account);
        emit WhitelistedAdded(account);
    }

    function _removeWhitelisted(address account) internal {
        _whitelisteds.remove(account);
        emit WhitelistedRemoved(account);
    }
}