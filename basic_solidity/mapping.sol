// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Action {
    mapping(address => uint256) public bids;

    function bid() public payable {
        bids[msg.sender] = msg.value;
    }
}
