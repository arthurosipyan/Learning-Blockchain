pragma solidity ^0.6.0;

contract HotelRoom {
    // Visibility
    // Events
    // Enums
    enum Statuses { Vacant, Occupied };
    Statuses currentStatus;
    
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
    
    modifier costs (uint _amount) {
        require(msg.value >= _amount, "Not enough Ether provided."); // Check price
    }
    
    function book() payable onlyWhileVacant costs(2 ether) {
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value); // Ether - pay smart contracts
    }
}
