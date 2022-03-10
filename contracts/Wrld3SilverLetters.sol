// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

import "./Wrdl3Items.sol";

contract Wrdl3SilverLetters is Wrdl3Items {
    uint8 public constant A_Silver = 31;
    uint8 public constant B_Silver = 32;
    uint8 public constant C_Silver = 33;
    uint8 public constant D_Silver = 34;
    uint8 public constant E_Silver = 35;
    uint8 public constant F_Silver = 36;
    uint8 public constant G_Silver = 37;
    uint8 public constant H_Silver = 38;

    uint8 public constant I_Silver = 39;
    uint8 public constant J_Silver = 40;
    uint8 public constant K_Silver = 41;
    uint8 public constant L_Silver = 42;
    uint8 public constant M_Silver = 43;
    uint8 public constant N_Silver = 44;
    uint8 public constant O_Silver = 45;
    uint8 public constant P_Silver = 46;

    uint8 public constant Q_Silver = 47;
    uint8 public constant R_Silver = 48;
    uint8 public constant S_Silver = 49;
    uint8 public constant T_Silver = 50;
    uint8 public constant U_Silver = 51;
    uint8 public constant V_Silver = 52;
    uint8 public constant W_Silver = 53;
    uint8 public constant X_Silver = 54;

    uint8 public constant Y_Silver = 55;
    uint8 public constant Z_Silver = 56;

    function buySilverLetters(
        address _player,
        uint8 _letterId,
        uint256 _amount
    ) public {
        require(balanceOf(_player, SILVER) >= 5 * _amount);
        require(_letterId >= 31 && _letterId <= 56);
        _burn(_player, SILVER, 5 * _amount);
        _mint(_player, _letterId, _amount, "");
    }
}
