// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crud {
    struct Person {
        string name;
        uint16 age;
        string job;
    }

    Person[] public persons;
    uint256 public totalPerson;

    event AddPerson(string indexed name, uint16 age, string job);
    event UpdatePerson(string indexed name, address indexed _updatedBy);
    event DeletePerson(string name);

    constructor() {
        totalPerson = 0;
    }

    function add(string memory name, uint16 age, string memory job) public returns (uint256) {
        persons.push(Person(name, age, job));
        totalPerson++;

        emit AddPerson(name, age, job);
        return totalPerson;
    }

    function updateName(uint256 indexToUpdate, string memory name) public returns (bool) {
        require(indexToUpdate < persons.length, "Index out of bounds");

        persons[indexToUpdate].name = name;
        emit UpdatePerson(name, msg.sender);
        return true;
    }

    function deletePerson(uint256 indexToDelete) public returns (string memory) {
        require(indexToDelete < persons.length, "Index out of bounds");

        string memory _personName = persons[indexToDelete].name;

        persons[indexToDelete] = persons[persons.length - 1];
        persons.pop();
        totalPerson--;

        emit DeletePerson(_personName);
        return _personName;
    }

    function getAllPersons() public view returns (Person[] memory) {
        return persons;
    }

    function getPerson(uint256 index) public view returns (string memory, uint16, string memory) {
        require(index < persons.length, "Index out of bounds");
        Person memory p = persons[index];
        return (p.name, p.age, p.job);
    }

    function getTotalPerson() public view returns (uint256) {
        return persons.length;
    }
}
