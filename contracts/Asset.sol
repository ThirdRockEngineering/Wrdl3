// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Asset is ERC1155 {
    uint256 public constant Bronze = 2;
    uint256 public constant Gold = 0;
    uint256 public constant Silver = 1;
    uint256 public constant lvl2 = 3;
    uint256 public constant lvl3 = 4;

    mapping(address => bool) lvl2s;
    mapping(address => bool) lvl3s;
    mapping(address => uint256) bronzes;
    mapping(address => uint256) golds;
    mapping(address => uint256) silvers;

    constructor()
        ERC1155(
            "https://ipfs.io/ipfs/bafybeictu2x3l2pavayql77j7qbusr3qpwix27sthll5qwdbssnchi5jei/{id}.json"
        )
    {}

    //*** MODIFIERS */

    modifier level2(address player) {
        require(balanceOf(player, lvl2) > 0);
        _;
    }

    modifier level3(address player) {
        require(balanceOf(player, lvl3) > 0);
        _;
    }

    modifier enoughForLvl2(address player) {
        require(balanceOf(player, Bronze) >= 10);
        _;
    }

    modifier enoughForLvl3(address player) {
        require(balanceOf(player, lvl2) > 0);
        require(balanceOf(player, Bronze) >= 20);
        require(balanceOf(player, Silver) >= 15);
        _;
    }

    //*** IN-GAME STUFF */
    function awardBronze(address player) public {
        _mint(player, Bronze, 1, "");
    }

    function awardGold(address player) public level3(player) {
        _mint(player, Gold, 1, "");
    }

    function awardSilver(address player) public level2(player) {
        _mint(player, Silver, 1, "");
    }

    function lvl2Achieve(address player) public enoughForLvl2(player) {
        _mint(player, lvl2, 1, "");
    }

    function lvl3Achieve(address player) public enoughForLvl2(player) {
        _mint(player, lvl3, 1, "");
    }
}
