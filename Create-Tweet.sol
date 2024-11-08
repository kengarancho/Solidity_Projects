// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Twitter {
    struct Tweet {
        address author;
        string content;
        uint likes;
    }

    Tweet[] public myTweet;
    mapping (address => Tweet[]) tweets;

    function createTweet(string memory _tweet) public {
        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function getTweet(address _owner, uint _index) public view returns(Tweet memory) {
        return tweets[_owner][_index];
    }

    function getAllTweets(address _owner) public view returns(Tweet[] memory) {
        return tweets[_owner];
    }

}


