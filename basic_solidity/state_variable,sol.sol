// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Property {
    int256 public price;
    string public constant location = "Viet Nam";

    // price = 100; this is not permitted in Solidity

    function f1() public pure returns (int256) {
        int256 x = 5;
        x = x * 2;

        string memory s1 = "abc";

        return x;
    }
}
