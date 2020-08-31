pragma solidity >=0.5.11 <0.7.0;
contract StartStopUpdateExample {
    address owner;
    bool public paused;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function sendMoney() public payable {
        
    }
    
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are not the owner");
        paused = _paused;
    }
    
    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, "You cannot withdraw");
        require(!paused, "Contract paused currently");
        _to.transfer(address(this).balance);
    }
    
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(_to);
    }
}
