// SPDX-License-Identifier: MIT
pragma solidity ^0.6.1;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/math/SafeMath.sol";
import "./Allowance.sol";

contract SharedWallet is Allowance {
    
    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);
    
    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "There are not enough funds stored in the smart contract");
        if(!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }
    
    function renounceOwnership() public override onlyOwner {
        revert("Can't renounce ownership here");
    }

    //prior sol0.6 the receive function is the funciton() external payable
    receive() external payable {
        MoneyReceived(msg.sender, msg.value);
    }
    
}
