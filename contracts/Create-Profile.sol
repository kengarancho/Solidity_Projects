// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

contract CreateProfile {
    struct Profile {
        string displayName;
        string bio;
    }

    uint MAX_NAME_LENGTH = 50;
    uint MAX_BIO_LENGTH = 160;

    mapping (address => Profile) profiles;

    function addProfile(string memory _displayName, string memory _bio) public {
        require(profiles[msg.sender].length == 0, "You already have a profile!");
        require(bytes(_displayName).length <= MAX_NAME_LENGTH, "Display Name too long!");
        require(bytes(_bio).length <= MAX_BIO_LENGTH, "Bio too long!");

        profiles[msg.sender] = Profile(_displayName, _bio);
    }

    function viewAllProfile() public view returns(Profile memory) {
        return profiles[msg.sender];
    }

}
