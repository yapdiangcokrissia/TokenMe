// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/access/Ownable.sol";

contract TokenMe is ERC20, Ownable {
    uint256 private constant TOKEN_UNIT = 1;

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // Initial minting can be done here if required
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount * TOKEN_UNIT);
    }

    function burn(address from, uint256 amount) external onlyOwner {
        _burn(from, amount * TOKEN_UNIT);
    }

    function transferTokens(address from, address to, uint256 amount) external onlyOwner {
        _transfer(from, to, amount * TOKEN_UNIT);
    }
}
