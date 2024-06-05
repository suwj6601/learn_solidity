// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Property {
    int256 public price;
    string location = "London";
    address public owner;

    constructor(int _price, string memory _location) {
        price = _price;
        location = _location;
        owner = msg.sender;
    }

    function setPrice(int256 _price) public {
        price = _price;
    }

    function getPrice() public view returns (int256) {
        return price;
    }
}
