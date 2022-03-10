// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Wrdl3Items is ERC1155 {
    uint256 public constant BRONZE = 2;
    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint256 public constant LVL2 = 3;
    uint256 public constant LVL3 = 4;

    constructor()
        ERC1155(
            "https://ipfs.io/ipfs/bafybeictu2x3l2pavayql77j7qbusr3qpwix27sthll5qwdbssnchi5jei/{id}.json"
        )
    {}

    //*** MODIFIERS */

    modifier level2(address player) {
        require(balanceOf(player, LVL2) > 0);
        _;
    }

    modifier level3(address player) {
        require(balanceOf(player, LVL3) > 0);
        _;
    }

    modifier enoughForLvl2(address player) {
        require(balanceOf(player, BRONZE) >= 10);
        _;
    }

    modifier enoughForLvl3(address player) {
        require(balanceOf(player, LVL2) > 0);
        require(balanceOf(player, BRONZE) >= 20);
        require(balanceOf(player, SILVER) >= 15);
        _;
    }

    //*** IN-GAME STUFF */
    function awardBronze(address player) public {
        _mint(player, BRONZE, 1, "");
    }

    function awardGold(address player) public level3(player) {
        _mint(player, GOLD, 1, "");
    }

    function awardSilver(address player) public level2(player) {
        _mint(player, SILVER, 1, "");
    }

    function lvl2Achieve(address player) public enoughForLvl2(player) {
        _mint(player, LVL2, 1, "");
    }

    function lvl3Achieve(address player) public enoughForLvl2(player) {
        _mint(player, LVL3, 1, "");
    }
}
