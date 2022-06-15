// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/// @title Rated Review prototype
/// @author Juan Asher

import "@openzeppelin/contracts/access/Ownable.sol";

contract Review {
    struct Data {
        uint256 CID;
        address reviewer;
        uint8 rating;
    }
    uint256 reviewCounter;
    address owner;
    mapping(uint256 => Data) public reviewDatabase;

    constructor(){
        reviewCounter = 0;
        owner = msg.sender;
    }

    function submitReview (uint256 _CID, uint256 _rating) external notOwner {
        require(_rating <= 5, "rating value must be between 1 to 5");
        require(_rating >= 1, "rating value must be between 1 to 5");
        reviewCounter += 1;
        reviewDatabase[reviewCounter] = Data({
            CID: _CID,
            reviewer: msg.sender,
            rating: uint8(_rating)
        });
    }

    modifier notOwner {
        require(msg.sender != owner);
        _;
    }
}