// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

import "./Wrdl3Items.sol";

contract Wrdl3InnerExchange is Wrdl3Items {
    function buyGoldWithSilver(address _player, uint256 _amount)
        public
        level3(_player)
    {
        require(balanceOf(_player, SILVER) >= _amount * 3);
        _burn(_player, SILVER, _amount * 3);
        _mint(_player, GOLD, _amount, "");
    }

    function buyGoldWithBronze(address _player, uint256 _amount)
        public
        level3(_player)
    {
        require(balanceOf(_player, BRONZE) >= _amount * 10);
        _burn(_player, BRONZE, _amount * 10);
        _mint(_player, GOLD, _amount, "");
    }

    function buySilverWithBronze(address _player, uint256 _amount)
        public
        level2(_player)
    {
        require(balanceOf(_player, BRONZE) >= _amount * 5);
        _burn(_player, BRONZE, _amount * 5);
        _mint(_player, SILVER, _amount, "");
    }

    function buyBronzeWithSilver(address _player, uint256 _amount)
        public
        level2(_player)
    {
        require(_amount % 5 == 0, "Amont should be divisible by 5");
        require(balanceOf(_player, SILVER) >= _amount / 5);
        _burn(_player, SILVER, _amount / 5);
        _mint(_player, BRONZE, _amount, "");
    }

    function buyBronzeWithGold(address _player, uint256 _amount)
        public
        level2(_player)
    {
        require(_amount % 10 == 0, "Amont should be divisible by 10");
        require(balanceOf(_player, GOLD) >= _amount / 10);
        _burn(_player, GOLD, _amount / 10);
        _mint(_player, BRONZE, _amount, "");
    }

    function buySilverWithGold(address _player, uint256 _amount)
        public
        level2(_player)
    {
        require(_amount % 3 == 0, "Amont should be divisible by 3");
        require(balanceOf(_player, GOLD) >= _amount / 3);
        _burn(_player, GOLD, _amount / 3);
        _mint(_player, SILVER, _amount, "");
    }
}
