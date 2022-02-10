//SPDX-License-Identifier: GPL

pragma solidity ^0.8.10;

contract AnimalFarm{


    // all the global variables
    uint count;
    string public anName;
    string public anColor;
    string public anSpecies;
    int public anAge;
 

    //user input functions
    function animalName(string memory _value) public {
        anName = _value;
    }

     function animalColor(string memory _value) public {
        anColor = _value;
    }
    function animalSpecies(string memory _value3) public {
        anSpecies = _value3;
    }

    function animalAge(int userInput) public{
        anAge = userInput;
    }

 
    // Name of factory
    string public constant FACTORY_NAME = "Animal Farm";
    
        
    //stucture
    struct Animal{
        string species;
        string name;
        string color;
        int age;
    }

    Animal[] public animals;


    //function

    function createAnimals() public{
        animals.push(Animal(anSpecies,anName,anColor,anAge));
        count += 1;
    }

 
}