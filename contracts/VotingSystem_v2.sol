// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

contract VotingSystem {
    uint voteCount = 0;
    address owner;

    struct Candidate {
        uint id;
        string name;
        uint votes;
    }

    struct Voter {
        bool hasVoted;
        uint candidateId;
    }

    Candidate[] public candidates;
    mapping (address => Voter) public voters;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner!");
        _;
    }

    function addCandidate(string memory _name) public onlyOwner {
        candidates.push(Candidate({
            id: candidates.length,
            name: _name,
            votes: 0
        }));
    }

    function viewCandidates() public view returns(Candidate[] memory) {
        return candidates;
    }

    function addVote(uint _candidateId) public {
        require(!voters[msg.sender].hasVoted, "You have already voted!");
        require(_candidateId < candidates.length, "Invalid candidate ID!");

        voters[msg.sender] = Voter({
            hasVoted: true,
            candidateId: _candidateId
        });

        candidates[_candidateId].votes += 1;
    }
/*
    function viewVoteCount(string memory _name) public view returns (uint) {
        return candidates[_name];
    }
*/
}
