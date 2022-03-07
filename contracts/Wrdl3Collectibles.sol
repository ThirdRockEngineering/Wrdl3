// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract GameItem is ERC721URIStorage {
    string public collectionURI = "https://ipfs.io/ipfs/{HASH}";
    address private admin;

    modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
    }

    constructor() ERC721("Wrdl3", "WORD") {
        admin = msg.sender;
    }

    function awardWord(address player, string memory _word)
        public
        returns (uint256)
    {
        uint256 _tokenId = uint256(keccak256(abi.encode(_word)));
        string memory _tokenURI = string(
            abi.encode(collectionURI, Strings.toString(_tokenId))
        );

        _mint(player, _tokenId);
        _setTokenURI(_tokenId, _tokenURI);

        return _tokenId;
    }

    function changeCollectionURI(string memory _newURI) public onlyAdmin {
        collectionURI = _newURI;
    }
}
