//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisibilityExample {
    uint public  secretNumber = 42;

    function getSecret() public view returns (uint) {
        return secretNumber;
    }
}