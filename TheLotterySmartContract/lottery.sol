pragma solidity >=0.5.0 <0.9.0;

contract Lottery {
    address payable[] public players;
    address public manager;

    // require(msg.sender == manager) is mean this function only call by manager

    constructor() {
        manager = msg.sender;
    }

    receive() external payable {
        require(msg.value == 0.1 ether);

        players.push(payable(msg.sender));
    }

    function getBalance() public view returns (uint256) {
        require(msg.sender == manager);

        return address(this).balance;
    }

    function random() public view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.difficulty,
                        block.timestamp,
                        players.length
                    )
                )
            );
    }

    function pickWinner() public  {
        require(msg.sender == manager);
        require(players.length >= 3);

        address payable winner;
        winner = players[random() % (players.length)];
        winner.transfer(getBalance());

        players = new address payable[](0) // resetting the Lottery
    }
}
