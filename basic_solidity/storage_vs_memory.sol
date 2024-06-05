// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract A {
    string[] public cities = ["Ha Noi", "Ho Chi Minh"];

    function f_memory() public {
        string[] memory s1 = cities;
        // string s2; -> error
        s1[0] = "New York";
    }

      function f_storage() public {
        string[] storage s1 = cities;
        // string s2; -> error
        s1[0] = "New York";
    }

    // with storage type, when override s1 variable, the root state has change, but using memory isnot change
}
