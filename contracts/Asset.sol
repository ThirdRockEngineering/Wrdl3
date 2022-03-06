// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@imtbl/imx-contracts/contracts/Mintable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Asset is ERC721URIStorage, Mintable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string BronzeURI =
        "https://ipfs.io/ipfs/bafybeifm2bvvfffis6tqwls4qd4bxtqdgo2uobwballv7xczr3goa5gl4m/bronze.jpg";
    string GoldURI =
        "https://ipfs.io/ipfs/bafybeifm2bvvfffis6tqwls4qd4bxtqdgo2uobwballv7xczr3goa5gl4m/gold.jpg";
    string SilverURI =
        "https://ipfs.io/ipfs/bafybeifm2bvvfffis6tqwls4qd4bxtqdgo2uobwballv7xczr3goa5gl4m/silver.jpg";
    string lvl2URI =
        "https://ipfs.io/ipfs/bafybeifm2bvvfffis6tqwls4qd4bxtqdgo2uobwballv7xczr3goa5gl4m/lvl2.png";
    string lvl3URI =
        "https://ipfs.io/ipfs/bafybeifm2bvvfffis6tqwls4qd4bxtqdgo2uobwballv7xczr3goa5gl4m/lvl3.png";

    mapping(address => bool) lvl2s;
    mapping(address => bool) lvl3s;
    mapping(address => uint256) bronzes;
    mapping(address => uint256) golds;
    mapping(address => uint256) silvers;

    constructor(
        address _owner,
        string memory _name,
        string memory _symbol,
        address _imx
    ) ERC721(_name, _symbol) Mintable(_owner, _imx) {}

    function _mintFor(
        address player,
        uint256 id,
        bytes memory blueprint
    ) internal override {
        _safeMint(player, id, blueprint);
    }

    //*** MODIFIERS */

    modifier level2(address player) {
        require(lvl2s[player]);
        _;
    }

    modifier level3(address player) {
        require(lvl3s[player]);
        _;
    }

    modifier enoughForLvl2(address player) {
        require(bronzes[player] == 10);
        _;
    }

    modifier enoughForLvl3(address player) {
        require(bronzes[player] == 20);
        require(silvers[player] == 10);
        _;
    }

    //*** IN-GAME STUFF */
    function awardBronze(address player) public {
        uint256 newItemId = _tokenIds.current();

        _tokenIds.increment();
        _mintFor(player, newItemId, "");
        _setTokenURI(newItemId, BronzeURI);

        bronzes[player]++;
    }

    function awardGold(address player) public level3(player) {
        uint256 newItemId = _tokenIds.current();

        _tokenIds.increment();
        _mintFor(player, newItemId, "");
        _setTokenURI(newItemId, GoldURI);

        golds[player]++;
    }

    function awardSilver(address player) public level2(player) {
        uint256 newItemId = _tokenIds.current();

        _tokenIds.increment();
        _mintFor(player, newItemId, "");
        _setTokenURI(newItemId, SilverURI);

        silvers[player]++;
    }

    function lvl2Achieve(address player) public enoughForLvl2(player) {
        uint256 newItemId = _tokenIds.current();

        _tokenIds.increment();
        _mintFor(player, newItemId, "");
        _setTokenURI(newItemId, lvl2URI);

        lvl2s[player] = true;
    }

    function lvl3Achieve(address player) public enoughForLvl2(player) {
        uint256 newItemId = _tokenIds.current();

        _tokenIds.increment();
        _mintFor(player, newItemId, "");
        _setTokenURI(newItemId, lvl3URI);

        lvl3s[player] = true;
    }
}
