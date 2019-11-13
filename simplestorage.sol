pragma solidity ^0.4.24;

contract SimpleStorage {
    uint private value;
    address private owner;
    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "SimpleStorage: caller is not owner");
        _;
    }
    
    function Set(uint _value) public onlyOwner {
        value = _value;
    }
    
    function Get() public view returns (uint) {
        return value;
    }
}
