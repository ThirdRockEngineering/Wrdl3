// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

import "./Wrdl3Items.sol";

contract Wrdl3Constructor is Wrdl3Items {
    mapping(address => mapping(uint256 => mapping(uint256 => uint256)))
        public compositions;

    function compose(
        address _player,
        uint256 _tokenId,
        uint256 _appendedTokenId,
        uint256 _amount
    ) public {
        require(balanceOf(_player, _tokenId) > 0);
        require(balanceOf(_player, _appendedTokenId) >= _amount);
        _burn(_player, _appendedTokenId, _amount);
        compositions[_player][_tokenId][_appendedTokenId] += _amount;
    }
}
