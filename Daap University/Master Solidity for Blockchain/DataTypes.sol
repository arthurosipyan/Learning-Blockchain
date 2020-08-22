pragma solidity ^0.6.0;

contract DataTypes {
    string public myString = "Hello, world!";
    bytes32 public myBytes32 = "Hello, world!";
    int public myInt = 1;
    uint public myUint = 1;
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1;
    address public myAddress = 0x07bF4Cd2034129D8841d8c0b4444ffabC7882EA6;

    struct MyStruct {
        uint myUint;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Hello, World!");

    // Local variable
    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
    }
}
