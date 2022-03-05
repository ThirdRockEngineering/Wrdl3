pragma solidity >=0.4.0 <0.9.0;

import "../client/node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract GameLogic is ERC1155 {
    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint8 public constant BRONZE = 2;
    mapping(address => bool) accessToSecondLvl;
    mapping(address => bool) accessToThirdLvl;

    constructor() public ERC1155("https://game.example/api/item/{id}.json") {}

    function goldAward() public {
        _mint(msg.sender, GOLD, 1, "");
    }

    function silverAward() public {
        _mint(msg.sender, SILVER, 1, "");
    }

    function bronzeAward() public {
        _mint(msg.sender, BRONZE, 1, "");
    }

    function giveAccessSecondLvl() public {
        accessToSecondLvl[msg.sender] = true;
    }

    function giveAccessThirdLvl() public {
        accessToThirdLvl[msg.sender] = true;
    }
}
