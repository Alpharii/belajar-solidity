// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator {
    uint result = 0;

    function add(uint a) public {
        result += a;
    }

    function subtract(uint a) public {
        result -= a;
    }

    function multiply(uint a) public {
        result *= a;
    }

    function divide(uint a) public {
        result /= a;
    }

    function getResult() public view returns (uint) {
        return result;
    }
}