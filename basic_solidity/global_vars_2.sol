pragma solidity >=0.5.0 <0.9.0;

contract GlobalVariale2 {
    uint256 public this_moment = block.timestamp;
    uint256 public block_number = block.number;
    uint256 public difficulty = block.difficulty;
    uint256 public gaslimit = block.gaslimit;
}
