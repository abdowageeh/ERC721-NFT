// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

import "@OpenZeppelin/contracts/token/ERC721/ERC721.sol";
import "@OpenZeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFT is ERC721URIStorage {
    uint256 private _tokenId = 1;
    constructor() ERC721("Wego NFT", "WAPE") {}

    function mintNFT(string memory jsonUri) public returns (uint256) {
        uint256 newTokenId = _tokenId;
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, jsonUri);
        _tokenId++;
        return newTokenId;
    }
}
