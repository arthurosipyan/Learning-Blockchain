pragma solidity ^0.6.0;

contract HotelRoom {
    // Enums
    enum Statuses { Vacant, Occupied }
    Statuses currentStatus;
    
    // Events
    event Occupy(address _occupant, uint _value);
    
    address payable public owner;
    
    constructor() public {
        owner = msg.sender;
        currentStatus = Statuses.Vacant;
    }
    
    // Modifiers
    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Vacant, "Currently occupied."); // Check status
        _;
    }
    
    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not enough Ether provided."); // Check price
        _;
    }
    
    receive() external payable onlyWhileVacant costs(2 ether) {
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value); // Ether - pay smart contracts
        emit Occupy(msg.sender, msg.value);
    }
}
