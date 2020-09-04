pragma solidity >=0.5.11 <0.7.0;

contract FunctionsExample {
    mapping(address => uint64) public balanceReceived;
    
    address payable owner;
    
    function getOwner() public view returns(address) {
        return owner;
    }
    
    function converWeiToEth(uint _amountInWei) public pure returns(uint) {
        return _amountInWei / 1 ether;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function destroySmartContract() public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(owner);
    }
    
    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += uint64(msg.value);
        
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "not enough funds");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= uint64(_amount);
        _to.transfer(_amount);
    }
    
    receive() external payable {
        receiveMoney();
    }
    
    
}
