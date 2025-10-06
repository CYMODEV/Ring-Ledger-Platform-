// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EscrowVault is Ownable {
    struct Escrow {
        address buyer;
        address seller;
        address token;
        uint256 amount;
        bool released;
    }

    uint256 public nextEscrowId;
    mapping(uint256 => Escrow) public escrows;

    event Created(uint256 id, address buyer, address seller, address token, uint256 amount);
    event Released(uint256 id);

    function create(address buyer, address seller, address token, uint256 amount) external onlyOwner returns (uint256) {
        uint256 id = ++nextEscrowId;
        escrows[id] = Escrow(buyer, seller, token, amount, false);
        require(IERC20(token).transferFrom(buyer, address(this), amount), "fund failed");
        emit Created(id, buyer, seller, token, amount);
        return id;
    }

    function release(uint256 id) external onlyOwner {
        Escrow storage e = escrows[id];
        require(!e.released, "released");
        e.released = true;
        require(IERC20(e.token).transfer(e.seller, e.amount), "release failed");
        emit Released(id);
    }
}
