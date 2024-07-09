// contracts/ERC721Token.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC721Token is ERC721Enumerable, Ownable {
    // Mapping from token ID to short text metadata
    mapping(uint256 => string) private _tokenTexts;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    function mint(address to, uint256 tokenId, string memory text) public onlyOwner {
        _safeMint(to, tokenId);
        _setTokenText(tokenId, text);
    }

    function _setTokenText(uint256 tokenId, string memory text) internal {
        require(_exists(tokenId), "ERC721Metadata: Text set of nonexistent token");
        _tokenTexts[tokenId] = text;
    }

    function tokenText(uint256 tokenId) public view returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: Text query for nonexistent token");
        return _tokenTexts[tokenId];
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721) {
        super._burn(tokenId);
        if (bytes(_tokenTexts[tokenId]).length != 0) {
            delete _tokenTexts[tokenId];
        }
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
