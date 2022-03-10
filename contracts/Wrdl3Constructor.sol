// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

import "./Wrdl3Items.sol";
// import "./Wrdl3Collectibles.sol";

contract Wrdl3Constructor is Wrdl3Items {
    mapping(address => mapping(uint256 => mapping(uint256 => uint256)))
        public compositions;

    function compose(
        address _sender,
        address _receiver,
        uint256 _tokenId,
        uint256 _appendedTokenId,
        uint256 _amount
    ) public {
        require(balanceOf(_sender, _appendedTokenId) >= _amount);
        // require(Wrdl3GameItem._ownerOf(_tokenId) == _receiver);
        _burn(_sender, _appendedTokenId, _amount);

        compositions[_receiver][_tokenId][_appendedTokenId] += _amount;
    }
}
