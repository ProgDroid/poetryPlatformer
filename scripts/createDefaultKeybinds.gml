///@description Creates default keybinds map
///@arg ds_map defaultKeybinds

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on createDefaultKeybinds: " + string(argument_count));
    exit;
}

if (is_undefined(argument0) || !ds_exists(argument0, ds_type_map)) {
    addConsoleMessage("warning", "Bad argument on createDefaultKeybinds. Expected ds_map, got " + string(typeof(argument0)));
    exit;
}

var playerUp     = ds_list_create();
ds_list_add(playerUp, ord('W'), vk_up, gp_padu, gp_axislv);

var playerDown   = ds_list_create();
ds_list_add(playerDown, ord('S'), vk_down, gp_padd, gp_axislv);

var playerLeft   = ds_list_create();
ds_list_add(playerLeft, ord('A'), vk_left, gp_padl, gp_axislh);

var playerRight  = ds_list_create();
ds_list_add(playerRight, ord('D'), vk_right, gp_padr, gp_axislh);

var jump         = ds_list_create();
ds_list_add(jump, vk_space, noone, gp_face1, noone);

var dash         = ds_list_create();
ds_list_add(dash, vk_shift, noone, gp_shoulderl, noone);

var dashConfirm  = ds_list_create();
ds_list_add(dashConfirm, vk_space, noone, gp_shoulderr, noone);

var start        = ds_list_create();
ds_list_add(start, vk_escape, noone, gp_start, noone);

var menuUp       = ds_list_create();
ds_list_add(menuUp, ord('W'), vk_up, gp_padu, gp_axislv);

var menuDown     = ds_list_create();
ds_list_add(menuDown, ord('S'), vk_down, gp_padd, gp_axislv);

var menuLeft     = ds_list_create();
ds_list_add(menuLeft, ord('A'), vk_left, gp_padl, gp_axislh);

var menuRight    = ds_list_create();
ds_list_add(menuRight, ord('D'), vk_right, gp_padr, gp_axislh);

var accept       = ds_list_create();
ds_list_add(accept, vk_space, vk_enter, gp_face1, noone);

var back         = ds_list_create();
ds_list_add(back, vk_escape, vk_backspace, gp_face2, noone);

var cameraUp     = ds_list_create();
ds_list_add(cameraUp, ord('I'), noone, gp_axisrv, noone);

var cameraDown   = ds_list_create();
ds_list_add(cameraDown, ord('K'), noone, gp_axisrv, noone);

var cameraLeft   = ds_list_create();
ds_list_add(cameraLeft, ord('J'), noone, gp_axisrh, noone);

var cameraRight  = ds_list_create();
ds_list_add(cameraRight, ord('L'), noone, gp_axisrh, noone);

var dashAimUp    = ds_list_create();
ds_list_add(dashAimUp, noone, noone, gp_axisrv, noone);

var dashAimDown  = ds_list_create();
ds_list_add(dashAimDown, noone, noone, gp_axisrv, noone);

var dashAimLeft  = ds_list_create();
ds_list_add(dashAimLeft, noone, noone, gp_axisrh, noone);

var dashAimRight = ds_list_create();
ds_list_add(dashAimRight, noone, noone, gp_axisrh, noone);

ds_map_add_list(argument0, "playerUp", playerUp);
ds_map_add_list(argument0, "playerDown", playerDown);
ds_map_add_list(argument0, "playerLeft", playerLeft);
ds_map_add_list(argument0, "playerRight", playerRight);
ds_map_add_list(argument0, "jump", jump);
ds_map_add_list(argument0, "dash", dash);
ds_map_add_list(argument0, "dashConfirm", dashConfirm);
ds_map_add_list(argument0, "start", start);
ds_map_add_list(argument0, "menuUp", menuUp);
ds_map_add_list(argument0, "menuDown", menuDown);
ds_map_add_list(argument0, "menuLeft", menuLeft);
ds_map_add_list(argument0, "menuRight", menuRight);
ds_map_add_list(argument0, "accept", accept);
ds_map_add_list(argument0, "back", back);
ds_map_add_list(argument0, "cameraUp", cameraUp);
ds_map_add_list(argument0, "cameraDown", cameraDown);
ds_map_add_list(argument0, "cameraLeft", cameraLeft);
ds_map_add_list(argument0, "cameraRight", cameraRight);
ds_map_add_list(argument0, "dashAimUp", dashAimUp);
ds_map_add_list(argument0, "dashAimDown", dashAimDown);
ds_map_add_list(argument0, "dashAimLeft", dashAimLeft);
ds_map_add_list(argument0, "dashAimRight", dashAimRight);

ds_map_add(argument0, "deadzone", CONTROLLER_DEADZONE);
ds_map_add(argument0, "buttonThreshold", CONTROLLER_BUTTON_THRESHOLD);

