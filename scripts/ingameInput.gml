/// ingameInput

playerUpHeld       = min(checkHeld(settingsController.keybinds[? "playerUp"]) * -1, checkAxis(settingsController.keybinds[? "playerUp"], true));
playerDownHeld     = max(checkHeld(settingsController.keybinds[? "playerDown"]), checkAxis(settingsController.keybinds[? "playerDown"], false));
playerLeftHeld     = min(checkHeld(settingsController.keybinds[? "playerLeft"]) * -1, checkAxis(settingsController.keybinds[? "playerLeft"], true));
playerRightHeld    = max(checkHeld(settingsController.keybinds[? "playerRight"]), checkAxis(settingsController.keybinds[? "playerRight"], false));

if (vectorLengthSquared(playerUpHeld + playerDownHeld, playerLeftHeld + playerRightHeld) < (settingsController.keybinds[? "deadzone"] * settingsController.keybinds[? "deadzone"])) {
    playerUpHeld    = 0;
    playerDownHeld  = 0;
    playerLeftHeld  = 0;
    playerRightHeld = 0;
}

playerJumpHeld     = checkHeld(settingsController.keybinds[? "jump"]);
playerDashHeld     = checkHeld(settingsController.keybinds[? "dash"]);
playerJumpPressed  = playerJumpPressed || checkPressed(settingsController.keybinds[? "jump"]);
playerDashPressed  = playerDashPressed || checkPressed(settingsController.keybinds[? "dash"]);
playerDashConfirm  = playerDashConfirm || checkPressed(settingsController.keybinds[? "dashConfirm"]);

playerDashAimUp    = min(0, checkAxis(settingsController.keybinds[? "dashAimUp"], true));
playerDashAimDown  = max(0, checkAxis(settingsController.keybinds[? "dashAimDown"], false));
playerDashAimLeft  = min(0, checkAxis(settingsController.keybinds[? "dashAimLeft"], true));
playerDashAimRight = max(0, checkAxis(settingsController.keybinds[? "dashAimRight"], false));

if (vectorLengthSquared(playerDashAimLeft + playerDashAimRight, playerDashAimUp + playerDashAimDown) < (settingsController.keybinds[? "deadzone"] * settingsController.keybinds[? "deadzone"])) {
    playerDashAimUp    = 0;
    playerDashAimDown  = 0;
    playerDashAimLeft  = 0;
    playerDashAimRight = 0;
}

playerDashAiming   = playerDashAimUp != 0 || playerDashAimDown != 0 || playerDashAimLeft != 0 || playerDashAimRight != 0;

cameraUp           = min(checkHeld(settingsController.keybinds[? "cameraUp"]) * -1, checkAxis(settingsController.keybinds[? "cameraUp"], true));
cameraDown         = max(checkHeld(settingsController.keybinds[? "cameraDown"]), checkAxis(settingsController.keybinds[? "cameraDown"], false));
cameraLeft         = min(checkHeld(settingsController.keybinds[? "cameraLeft"]) * -1, checkAxis(settingsController.keybinds[? "cameraLeft"], true));
cameraRight        = max(checkHeld(settingsController.keybinds[? "cameraRight"]), checkAxis(settingsController.keybinds[? "cameraRight"], false));

