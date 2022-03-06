pragma solidity >=0.4.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Items is ERC1155 {
    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint8 public constant BRONZE = 2;
    uint8 public constant ACCESS2 = 3;
    uint8 public constant ACCESS3 = 4;
    mapping(address => bool) accessToSecondLvl;
    mapping(address => bool) accessToThirdLvl;

    constructor() public ERC1155("https://game.example/api/item/{id}.json") {
        _mint(msg.sender, GOLD, 1000, "");
        _mint(msg.sender, SILVER, 10000, "");
        _mint(msg.sender, BRONZE, 17000, "");
        _mint(msg.sender, ACCESS2, 10000, "");
        _mint(msg.sender, ACCESS3, 1000, "");
    }
}
