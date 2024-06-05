pragma solidity >=0.5.0 <0.9.0;

contract A {
    int256 public x = 10;
    int256 y = 20;

    function get_y() public view returns (int256) {
        return y;
    }

    function f1() private view returns (int256) {
        return x;
    }

    function f2() public view returns (int256) {
        return f1();
    }

    function f3() internal view returns (int256) {
        return x;
    }

    function f4() external view returns (int256) {
        return x+1;
    }

    function f5() public view returns (int256) {
        int256 b;
        // b = f4(); -> f4() is external

        return b;
    }
}

contract B is A {
    int256 public xx = f3();
    // int256 public yy = f1(); -> f1() is private, so it cannot be call here
}

contract C {
    A public contract_a = new A();

    int public xx = contract_a.f4();

    // int public y = contract_a.f1();
    // int public yy = contract_a.f3();

}
