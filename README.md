# Token Contracts Repository

This repository contains two smart contracts: a `Stablecoin` contract and an `ERC721Token` contract. These contracts are written in Solidity and designed to work on the Ethereum blockchain.

## Contracts

### Stablecoin.sol

The `Stablecoin` contract is a basic implementation of a stablecoin with functionalities for minting, transferring, and approving tokens. It also includes features such as pausing the contract, adding minters, and blacklisting addresses.

#### Key Features:
- **Name, Symbol, and Decimals:** Configurable during deployment.
- **Minting:** Only allowed for addresses marked as minters.
- **Pausing:** Can pause and unpause the contract.
- **Blacklist:** Prevents certain addresses from interacting with the contract.
- **Transfer:** Transfer tokens between addresses.
- **Approve:** Approve another address to spend tokens on behalf of the owner.
- **Transfer From:** Transfer tokens on behalf of another address.

#### Events:
- `Transfer`
- `Approval`
- `Issued`

#### Modifiers:
- `notBlacklisted`
- `onlyOwner`
- `onlyMinter`
- `notPaused`

#### Constructor Parameters:
- `string memory _name`
- `string memory _symbol`
- `uint8 _decimals`
- `uint _initialSupply`
- `address _owner`

### ERC721Token.sol

The `ERC721Token` contract is an implementation of a non-fungible token (NFT) using the ERC721 standard with enumerable and ownable extensions. This contract allows the minting of tokens with associated short text metadata.

#### Key Features:
- **Minting:** Only the contract owner can mint new tokens.
- **Text Metadata:** Each token can have associated short text metadata.
- **Enumerable:** Tokens are enumerable.
- **Ownable:** Ownership of the contract can be transferred.

#### Functions:
- `mint(address to, uint256 tokenId, string memory text)`
- `tokenText(uint256 tokenId) public view returns (string memory)`

#### Internal Functions:
- `_setTokenText(uint256 tokenId, string memory text)`

#### Overrides:
- `_beforeTokenTransfer`
- `_burn`
- `supportsInterface`