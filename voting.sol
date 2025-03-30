//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Voting {
    address public owner;
    bool public votingOpen;

    struct Candidate {
        string name;
        uint voteCount;
    }

    mapping (address=>bool) public hasVoted;
    Candidate[3] public candidates;

    constructor(){
        owner = msg.sender;
        votingOpen = true;

        candidates[0] = Candidate("Anies Baswedan", 0);
        candidates[1] = Candidate("Prabowo Subianto", 0);
        candidates[2] = Candidate("Ganjar Pranowo", 0);
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    modifier onlyWhenOpen(){
        require(votingOpen, "Voting is closed");
        _;
    }

    function vote(uint _candidateIndex) public onlyWhenOpen {
        require(!hasVoted[msg.sender], "You have voted");
        require(_candidateIndex < candidates.length, "Invalid candidate index");

        hasVoted[msg.sender] = true;
        candidates[_candidateIndex].voteCount++;
    }

    function closeVoting() public onlyOwner {
        votingOpen = false;
    }

    function getResults() public view returns(Candidate[3] memory) {
        return candidates;
    }

    function getWinner() public view returns (string memory) {
        uint maxVotes = 0;
        uint winnerIndex = 0;

        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                winnerIndex = i;
            }
        }

        return candidates[winnerIndex].name;
    }
}