// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AssetNFT is ERC721URIStorage, Ownable {
    uint256 public nextId;

    event Minted(uint256 indexed tokenId, address indexed to, string category, string uri);

    constructor() ERC721("Ring Asset", "RASS") {}

    function mint(address to, string memory category, string memory uri) external onlyOwner returns (uint256) {
        uint256 tokenId = ++nextId;
        _mint(to, tokenId);
        _setTokenURI(tokenId, uri);
        emit Minted(tokenId, to, category, uri);
        return tokenId;
    }
}
