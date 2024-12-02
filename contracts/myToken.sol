// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

contract myToken {
    string public tokenName = "Axie University";
    string public tokenAbbr = "AXU";
    uint public supply = 0;

    function mint(uint _mintSupply) public {
        supply += _mintSupply;
    }

    function burn(uint _burnSupply) public {
        supply -= _burnSupply;
    }

}
