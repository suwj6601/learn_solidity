// SPDX-License-Identifier: GPL-3.0

pragma sodility 0.8.0;

contract Property {
  int public value;

  function setValue  (int _value) public {
    value = _value
  }
}