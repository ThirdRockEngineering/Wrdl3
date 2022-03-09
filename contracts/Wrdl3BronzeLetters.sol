// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

import "./Wrdl3Items.sol";

contract Wrdl3BronzeLetters is Wrdl3Items {
    uint8 public constant A_Bronze = 5;
    uint8 public constant B_Bronze = 6;
    uint8 public constant C_Bronze = 7;
    uint8 public constant D_Bronze = 8;
    uint8 public constant E_Bronze = 9;
    uint8 public constant F_Bronze = 10;
    uint8 public constant G_Bronze = 11;
    uint8 public constant H_Bronze = 12;

    uint8 public constant I_Bronze = 13;
    uint8 public constant J_Bronze = 14;
    uint8 public constant K_Bronze = 15;
    uint8 public constant L_Bronze = 16;
    uint8 public constant M_Bronze = 17;
    uint8 public constant N_Bronze = 18;
    uint8 public constant O_Bronze = 19;
    uint8 public constant P_Bronze = 20;

    uint8 public constant Q_Bronze = 21;
    uint8 public constant R_Bronze = 22;
    uint8 public constant S_Bronze = 23;
    uint8 public constant T_Bronze = 24;
    uint8 public constant U_Bronze = 25;
    uint8 public constant V_Bronze = 26;
    uint8 public constant W_Bronze = 27;
    uint8 public constant X_Bronze = 28;

    uint8 public constant Y_Bronze = 29;
    uint8 public constant Z_Bronze = 30;

    function buyBronzeLetters(
        address _player,
        uint8 _letterId,
        uint256 _amount
    ) public {
        require(balanceOf(_player, BRONZE) >= 5 * _amount);
        require(_letterId >= 5 && _letterId <= 30);
        _burn(_player, BRONZE, 5 * _amount);
        _mint(_player, _letterId, _amount, "");
    }
}
