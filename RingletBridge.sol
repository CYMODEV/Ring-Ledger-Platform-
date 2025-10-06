// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract RingletBridge is Ownable {
    event Locked(address nft, uint256 tokenId, address from, bytes32 targetRinglet);
    event Unlocked(address nft, uint256 tokenId, address to, bytes32 sourceRinglet);

    function lock(address nft, uint256 tokenId, bytes32 targetRinglet) external {
        IERC721(nft).transferFrom(msg.sender, address(this), tokenId);
        emit Locked(nft, tokenId, msg.sender, targetRinglet);
    }

    function unlock(address nft, uint256 tokenId, address to, bytes32 sourceRinglet) external onlyOwner {
        IERC721(nft).transferFrom(address(this), to, tokenId);
        emit Unlocked(nft, tokenId, to, sourceRinglet);
    }
}
