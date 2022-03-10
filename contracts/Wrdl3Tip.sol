// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

import "./Wrdl3Items.sol";
import "./Wrdl3BronzeLetters.sol";
import "./Wrld3SilverLetters.sol";
import "./Wrdl3GoldLetters.sol";
import "./Wrdl3Constructor.sol";

contract Wrdl3Tip is
    Wrdl3BronzeLetters,
    Wrdl3GoldLetters,
    Wrdl3Constructor,
    Wrdl3SilverLetters
{
    function goldTip(
        address _to,
        address _from,
        uint256 _wordId,
        uint8 _letterId,
        uint256 _amount
    ) public {
        require(_letterId >= 57 && _letterId <= 82);

        compose(_from, _to, _wordId, _letterId, _amount);
    }

    function silverTip(
        address _to,
        address _from,
        uint256 _wordId,
        uint8 _letterId,
        uint256 _amount
    ) public {
        require(_letterId >= 31 && _letterId <= 56);

        compose(_from, _to, _wordId, _letterId, _amount);
    }

    function bronzeTip(
        address _to,
        address _from,
        uint256 _wordId,
        uint8 _letterId,
        uint256 _amount
    ) public {
        require(_letterId >= 5 && _letterId <= 30);

        compose(_from, _to, _wordId, _letterId, _amount);
    }
}
