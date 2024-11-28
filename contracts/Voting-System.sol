// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

contract VotingSystem {
    uint voteCount = 0;

    struct Candidate {
        string name;
        uint votes;
    }

    Candidate[] public candidatesArr;
    mapping (string => uint) public candidates;

    function addCandidate(string memory _name) public {
        candidatesArr.push(Candidate(_name, 0));
        candidates[_name] = voteCount;
    }

    function viewCandidates() public view returns(Candidate[] memory) {
        return candidatesArr;
    }

    function addVote(uint index) public {
        require(index < candidatesArr.length, "Index out of bounds");
        candidatesArr[index].votes += 1;
    }

    function viewVoteCount(string memory _name) public view returns (uint) {
        return candidates[_name];
    }
}
