///@description Generate print strings for dev mode printing
///@return array<string>

var strings;

strings[45] = "directionChange: " + string(objPlayer.directionChange);
strings[44] = "room_speed: " + string(room_speed);
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
strings[27] = "    dash: " + string(script_get_name(objPlayer.dash));
strings[26] = "    die: " + string(script_get_name(objPlayer.die));
strings[25] = "    land: " + string(script_get_name(objPlayer.land));
strings[24] = "    doubleJump: " + string(script_get_name(objPlayer.doubleJump));
strings[23] = "    slideAlongWalls: " + string(script_get_name(objPlayer.slideAlongWalls));
strings[22] = "    moveVertical: " + string(script_get_name(objPlayer.moveVertical));
strings[21] = "    collectStuff: " + string(script_get_name(objPlayer.collectStuff));
strings[20] = "    moveHorizontal: " + string(script_get_name(objPlayer.moveHorizontal));
strings[19] = "    facingDirection: " + string(script_get_name(objPlayer.facingDirection));
strings[18] = "scripts:";
strings[17] = "maxDashes: " + string(objPlayer.maxDashes);
strings[16] = "dashes: " + string(objPlayer.dashes);
strings[15] = "connected pads: " + string(ds_list_size(inputController.connectedPads));
strings[14] = "active pad: " + string(inputController.activePad);
strings[13] = "input type: " + string(inputController.currentInputType);
strings[12] = "double jump: " + string(objPlayer.doubleJump == doubleJumpScript);
strings[11] = "last dir: " + string(objPlayer.lastDir);
strings[10] = "drawing scale Y: " + string(objPlayer.drawingScaleY);
strings[9]  = "drawing scale X: " + string(objPlayer.drawingScaleX);
strings[8]  = "facing direction: " + string(objPlayer.facingDir);
strings[7]  = "horizontal speed: " + string(objPlayer.horizontalSpeed);
strings[6]  = "sprite: " + sprite_get_name(objPlayer.sprite_index);
strings[5]  = "time factor: " + string(timeFactorController.timeFactor);
strings[4]  = "target fps: " + string(global._ts_fps);
strings[3]  = "Collectibles: " + dec_to_bin(worldController.collectiblesFound);
strings[2]  = "Delta Time: " + string(delta_time);
strings[1]  = "FPS: " + string(fps);
strings[0]  = "State: " + objPlayer.state_name;

return strings;

