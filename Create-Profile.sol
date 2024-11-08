// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Profile {
    struct User {
        address author;
        string username;
        string bio;
    }

    mapping (address => User[]) public profiles;

    function createProfile(string memory _username, string memory _bio) public {
        profiles[msg.sender].push(User(msg.sender, _username, _bio));
    }

   function getProfile() public view returns (User[] memory) {
        return profiles[msg.sender];
    }

    function getUserAtIndex(uint _index) public view returns (User memory) {
        return profiles[msg.sender][_index];
    }

}
