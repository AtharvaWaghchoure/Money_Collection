// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//This fill will also have the code for sectors 

contract District{
    address[] sectors;

    function addSector(address newSector) public {
        sectors.push(newSector);
    }

    // function 
}