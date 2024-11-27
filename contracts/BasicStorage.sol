// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

contract BasicStorage {
    uint favoriteNumber;
    address public owner;

    uint[] public numbers;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    function setFavoriteNumber(uint _num) public {
        numbers.push(_num);
    }

    function getFavoriteNumber(uint index) public view returns(uint) {
        return numbers[index];
    }

    function getAllFavoriteNumber() public view returns(uint[] memory) {
        return numbers;
    }

    function updateNumber(uint index, uint _newNumber) public onlyOwner {
        require(index < numbers.length, "Invalid index");
        numbers[index] = _newNumber;
    }

    function deleteNumber(uint index) public onlyOwner {
        require(index < numbers.length, "Invalid index");
        numbers[index] = numbers[numbers.length - 1];
        numbers.pop();
    }

}