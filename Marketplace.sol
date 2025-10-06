// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Marketplace is Ownable {
    struct Listing {
        address seller;
        address nft;
        uint256 tokenId;
        address paymentToken;
        uint256 price;
        bool active;
    }

    uint256 public nextListingId;
    mapping(uint256 => Listing) public listings;

    event Listed(uint256 id, address seller, address nft, uint256 tokenId, uint256 price);
    event Purchased(uint256 id, address buyer);

    function list(address nft, uint256 tokenId, address paymentToken, uint256 price) external returns (uint256) {
        IERC721(nft).transferFrom(msg.sender, address(this), tokenId);

        uint256 id = ++nextListingId;
        listings[id] = Listing(msg.sender, nft, tokenId, paymentToken, price, true);
        emit Listed(id, msg.sender, nft, tokenId, price);
        return id;
    }

    function buy(uint256 id) external {
        Listing storage l = listings[id];
        require(l.active, "inactive");
        l.active = false;

        require(IERC20(l.paymentToken).transferFrom(msg.sender, l.seller, l.price), "pay failed");
        IERC721(l.nft).transferFrom(address(this), msg.sender, l.tokenId);
        emit Purchased(id, msg.sender);
    }
}
