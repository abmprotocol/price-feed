pragma solidity ^0.4.23;

import "src/price-feed.sol";

contract FeedFactory {
    event Created(address indexed sender, address feed);
    mapping(address=>bool) public isFeed;

    function create() public returns (PriceFeed) {
        address feed = new PriceFeed();
        emit Created(msg.sender, feed);
        PriceFeed(feed).setOwner(msg.sender);
        isFeed[feed] = true;
        return PriceFeed(feed);
}
