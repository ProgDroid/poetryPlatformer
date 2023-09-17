/// menuInput

menuUpPressed    = menuUpPressed || checkPressed(settingsController.keybinds[? "menuUp"]);
menuDownPressed  = menuDownPressed || checkPressed(settingsController.keybinds[? "menuDown"]);
menuLeftPressed  = menuLeftPressed || checkPressed(settingsController.keybinds[? "menuLeft"]);
menuRightPressed = menuRightPressed || checkPressed(settingsController.keybinds[? "menuRight"]);

menuUpHeld    = min(checkHeld(settingsController.keybinds[? "menuUp"]) * -1, checkAxis(settingsController.keybinds[? "menuUp"], true));
menuDownHeld  = max(checkHeld(settingsController.keybinds[? "menuDown"]), checkAxis(settingsController.keybinds[? "menuDown"], false));
menuLeftHeld  = min(checkHeld(settingsController.keybinds[? "menuLeft"]) * -1, checkAxis(settingsController.keybinds[? "menuLeft"], true));
menuRightHeld = max(checkHeld(settingsController.keybinds[? "menuRight"]), checkAxis(settingsController.keybinds[? "menuRight"], false));

if (vectorLengthSquared(menuUpHeld + menuDownHeld, menuLeftHeld + menuRightHeld) < (settingsController.keybinds[? "deadzone"] * settingsController.keybinds[? "deadzone"])) {
    menuUpHeld    = 0;
    menuDownHeld  = 0;
    menuLeftHeld  = 0;
    menuRightHeld = 0;
}

menuAccept = menuAccept || checkPressed(settingsController.keybinds[? "accept"]);
menuBack   = menuBack || checkPressed(settingsController.keybinds[? "back"]);

