//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    string public myString = "Hello, World!";
    uint256 public myUint = 123;
    int public myInt = -123;
    bool public myBool = true;
    address public owner = msg.sender;

    uint public count = 0;

    function increment() public {
        count += 1;
    }

    function decrement() public {
        count -= 1;
    }

    function getCount() public view returns (uint) {
        return count;
    }
}