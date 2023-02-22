pragma solidity >0.5.1 <0.6.0;

contract FlawedVoting {
    mapping (address => uint256) public remainingVotes; 
    uint256[] public candidates; 
    address owner;
    bool hasEnded = false;
    
    modifier notEnded() {
        require(!hasEnded);
        _;
    }
    
    constructor(uint256[] memory _candidates, uint256 _numVotesPerVoter) public {
        candidates = _candidates;
        owner = msg.sender;
        for (uint256 i = 0; i < _candidates.length; i++) {
            remainingVotes[msg.sender] += _numVotesPerVoter;
        }
    }
    
    function vote(uint256 _candidateIndex) public notEnded {
        require(remainingVotes[msg.sender] > 0);
        require(_candidateIndex < candidates.length);
        
        remainingVotes[msg.sender]--;
        
        // code to tally the vote
    }
    
    function endVoting() public {
        require(msg.sender == owner);
        hasEnded = true;
    }
}