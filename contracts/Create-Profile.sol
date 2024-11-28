// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

contract CreateProfile {
    struct Profile {
        string displayName;
        string bio;
    }

    mapping (address => Profile) profiles;

    function addProfile(string memory _displayName, string memory _bio) public {
        profiles[msg.sender] = Profile(_displayName, _bio);
    }

    function viewAllProfile() public view returns(Profile memory) {
        return profiles[msg.sender];
    }

}
