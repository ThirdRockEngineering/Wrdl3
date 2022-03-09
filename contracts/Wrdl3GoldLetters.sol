// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

import "./Wrdl3Items.sol";

contract Wrdl3BronzeLetters is Wrdl3Items {
    uint8 public constant A_Gold = 57;
    uint8 public constant B_Gold = 58;
    uint8 public constant C_Gold = 59;
    uint8 public constant D_Gold = 60;
    uint8 public constant E_Gold = 61;
    uint8 public constant F_Gold = 62;
    uint8 public constant G_Gold = 63;
    uint8 public constant H_Gold = 64;

    uint8 public constant I_Gold = 65;
    uint8 public constant J_Gold = 66;
    uint8 public constant K_Gold = 67;
    uint8 public constant L_Gold = 68;
    uint8 public constant M_Gold = 69;
    uint8 public constant N_Gold = 70;
    uint8 public constant O_Gold = 71;
    uint8 public constant P_Gold = 72;

    uint8 public constant Q_Gold = 73;
    uint8 public constant R_Gold = 74;
    uint8 public constant S_Gold = 75;
    uint8 public constant T_Gold = 76;
    uint8 public constant U_Gold = 77;
    uint8 public constant V_Gold = 78;
    uint8 public constant W_Gold = 79;
    uint8 public constant X_Gold = 80;

    uint8 public constant Y_Gold = 81;
    uint8 public constant Z_Gold = 82;

    function buySilverLetters(
        address _player,
        uint8 _letterId,
        uint256 _amount
    ) public {
        require(balanceOf(_player, GOLD) >= 5 * _amount);
        require(_letterId >= 57 && _letterId <= 82);
        _burn(_player, GOLD, 5 * _amount);
        _mint(_player, _letterId, _amount, "");
    }
}
