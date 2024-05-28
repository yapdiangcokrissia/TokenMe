# TokenMe 

## Overview

TokenMe is a custom ERC20 token contract built using OpenZeppelin's library. This contract allows for minting, burning, and transferring tokens, with the restriction that only the contract owner can perform these operations.

## Prerequisites

Before deploying the TokenMe contract, ensure you have the following prerequisites:

- Remix IDE (https://remix.ethereum.org/)
- MetaMask or another Ethereum wallet
- Access to an Ethereum test network (e.g., Ropsten, Rinkeby) or a local Ethereum node

## Contract Code

Here is the TokenMe contract code:

```solidity
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
```

## Deployment Using Remix

1. **Open Remix IDE**: Go to [Remix IDE](https://remix.ethereum.org/).

2. **Create a New File**: 
   - Click on the `File Explorers` tab.
   - Click the `+` icon to create a new file.
   - Name the file `TokenMe.sol`.

3. **Paste the Contract Code**: Copy the contract code above and paste it into `TokenMe.sol`.

4. **Compile the Contract**:
   - Click on the `Solidity Compiler` tab (the icon with the "S" and a wrench).
   - Ensure the compiler version is set to `0.8.0` or above.
   - Click the `Compile TokenMe.sol` button.

5. **Deploy the Contract**:
   - Click on the `Deploy & Run Transactions` tab (the icon with the Ethereum logo).
   - Select `Injected Web3` in the `Environment` dropdown to use MetaMask.
   - Ensure your MetaMask is connected to the desired network (e.g., Ropsten).
   - Click the `Deploy` button under the `Deploy` section.
   - Confirm the transaction in MetaMask.

## Contract Usage

### Minting Tokens

The `mint` function allows the contract owner to mint new tokens.

```solidity
function mint(address to, uint256 amount) external onlyOwner
```

- `to`: The address to receive the minted tokens.
- `amount`: The number of tokens to mint.

### Burning Tokens

The `burn` function allows the contract owner to burn tokens from a specified address.

```solidity
function burn(address from, uint256 amount) external onlyOwner
```

- `from`: The address from which tokens will be burned.
- `amount`: The number of tokens to burn.

### Transferring Tokens

The `transferTokens` function allows the contract owner to transfer tokens from one address to another.

```solidity
function transferTokens(address from, address to, uint256 amount) external onlyOwner
```

- `from`: The address from which tokens will be transferred.
- `to`: The address to receive the tokens.
- `amount`: The number of tokens to transfer.

## Security

This contract restricts minting, burning, and transferring operations to the contract owner only. Ensure that the owner account is secure to prevent unauthorized actions.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

For any questions or support, please open an issue on the repository or contact the maintainer.
