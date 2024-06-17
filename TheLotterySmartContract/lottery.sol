pragma solidity >=0.5.0 <0.9.0;

contract Lottery {
    address payable[] public players;
    address public manager;

    // require(msg.sender == manager) is mean this function only call by manager

    constructor() {
        manager = msg.sender;

        // make manager automatically jojn lottery
        players.push(payable(msg.sender));
    }

    receive() external payable {
        require(msg.value == 0.1 ether);

        // make manger cannot join the lottery
        // require(this.manager != msg.sender);

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

    function pickWinner() public {
        require(players.length >= 3);
        require(msg.sender == manager);

        // make manager receove 10% fee of total prize
        uint256 totalValue = getBalance();
        uint256 winnerPrize = (totalValue * 90) / 100;
        uint256 managerFee = (totalValue * 10) / 100;

        address payable winner;
        winner = players[random() % (players.length)];
        winner.transfer(winnerPrize);

        payable(manager).transfer(managerFee);

        players = new address payable[](0); // resetting the Lottery
    }
}
