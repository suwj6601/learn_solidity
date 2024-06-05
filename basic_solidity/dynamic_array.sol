// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract DynamicArrays {
    uint256[] public numbers;

    function getLength() public view returns (uint256) {
        return numbers.length;
    }

    function addElement(uint256 item) public {
        numbers.push(item);
    }

    function getElement(uint256 i) public view returns (uint256) {
        if (i < numbers.length) {
            return numbers[i];
        }

        return 0;
    }

    function popElement() public {
        numbers.pop();
    }

    function f() public  {
        uint256[] memory y = new uint256[](3);
        y[0] = 10;
        y[1] = 20;
        y[2] = 30;

        numbers = y;
    }
}
