///@description Generate print strings for dev mode printing
///@return array<string>

var strings;

strings[56] = "current option: ";
strings[55] = "current room: ";
strings[54] = "current menu GUI: ";
strings[53] = "typing array start: ";
strings[52] = "menu on: ";
strings[51] = "current menu: ";
strings[50] = "underline animation: ";
strings[49] = "room_speed: " + string(room_speed);
strings[48] = "        menuRightHeld: " + string(inputController.menuRightHeld);
strings[47] = "        menuLeftHeld: " + string(inputController.menuLeftHeld);
strings[46] = "        menuDownHeld: " + string(inputController.menuDownHeld);
strings[45] = "        menuUpHeld: " + string(inputController.menuUpHeld);
strings[44] = "    menu:";
strings[43] = "        dashAimRight: " + string(inputController.playerDashAimRight);
strings[42] = "        dashAimLeft: " + string(inputController.playerDashAimLeft);
strings[41] = "        dashAimDown: " + string(inputController.playerDashAimDown);
strings[40] = "        dashAimUp: " + string(inputController.playerDashAimUp);
strings[39] = "        dashConfirm: " + string(inputController.playerDashConfirm);
strings[38] = "        dashPressed: " + string(inputController.playerDashPressed);
strings[37] = "        jumpPressed: " + string(inputController.playerJumpPressed);
strings[36] = "        dashHeld: " + string(inputController.playerDashHeld);
strings[35] = "        jumpHeld: " + string(inputController.playerJumpHeld);
strings[34] = "        rightHeld: " + string(inputController.playerRightHeld);
strings[33] = "        leftHeld: " + string(inputController.playerLeftHeld);
strings[32] = "        downHeld: " + string(inputController.playerDownHeld);
strings[31] = "        upHeld: " + string(inputController.playerUpHeld);
strings[30] = "    player:";
strings[29] = "inputs:";
strings[28] = "pause factor: " + string(timeFactorController.pauseFactor);
strings[27] = "    dash: ";
strings[26] = "    die: ";
strings[25] = "    land: ";
strings[24] = "    doubleJump: ";
strings[23] = "    slideAlongWalls: ";
strings[22] = "    moveVertical: ";
strings[21] = "    collectStuff: ";
strings[20] = "    moveHorizontal: ";
strings[19] = "    facingDirection: ";
strings[18] = "scripts:";
strings[17] = "maxDashes: ";
strings[16] = "dashes: ";
strings[15] = "connected pads: " + string(ds_list_size(inputController.connectedPads));
strings[14] = "active pad: " + string(inputController.activePad);
strings[13] = "input type: " + string(inputController.currentInputType);
strings[12] = "double jump: ";
strings[11] = "last dir: ";
strings[10] = "drawing scale Y: ";
strings[9]  = "drawing scale X: ";
strings[8]  = "facing direction: ";
strings[7]  = "horizontal speed: ";
strings[6]  = "sprite: ";
strings[5]  = "time factor: " + string(timeFactorController.timeFactor);
strings[4]  = "target fps: " + string(global._ts_fps);
strings[3]  = "Collectibles: ";
strings[2]  = "Delta Time: " + string(delta_time);
strings[1]  = "FPS: " + string(fps);
strings[0]  = "State: ";

if (instance_exists(objPlayer)) {
    strings[27] += string(script_get_name(objPlayer.dash));
    strings[26] += string(script_get_name(objPlayer.die));
    strings[25] += string(script_get_name(objPlayer.land));
    strings[24] += string(script_get_name(objPlayer.doubleJump));
    strings[23] += string(script_get_name(objPlayer.slideAlongWalls));
    strings[22] += string(script_get_name(objPlayer.moveVertical));
    strings[21] += string(script_get_name(objPlayer.collectStuff));
    strings[20] += string(script_get_name(objPlayer.moveHorizontal));
    strings[19] += string(script_get_name(objPlayer.facingDirection));
    strings[17] += string(objPlayer.maxDashes);
    strings[16] += string(objPlayer.dashes);
    strings[12] += string(objPlayer.doubleJump == doubleJumpScript);
    strings[11] += string(objPlayer.lastDir);
    strings[10] += string(objPlayer.drawingScaleY);
    strings[9]  += string(objPlayer.drawingScaleX);
    strings[8]  += string(objPlayer.facingDir);
    strings[7]  += string(objPlayer.horizontalSpeed);
    strings[6]  += sprite_get_name(objPlayer.sprite_index);
    strings[0]  += objPlayer.state_name;
}

if (instance_exists(worldController)) {
    strings[3] += dec_to_bin(worldController.collectiblesFound);
}

if (instance_exists(menuController)) {
    strings[56] += string(menuController.currentOption);
    strings[54] += string(script_get_name(menuController.menuGUI));
    strings[53] += string(menuController.typingArray[0]);
    strings[52] += string(menuController.menuOn);
    strings[51] += string(menuController.currentMenu);
    strings[50] += script_get_name(menuController.underlineAnimation);
}

strings[55] += string(room_get_name(room));

return strings;

