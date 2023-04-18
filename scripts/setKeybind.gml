///setKeybind(currentOption, lastKey, bind)

if (argument_count != 3) {
    addConsoleMessage("warning", "Bad argument count on setKeybind: " + string(argument_count));
    exit;
}

var bindList = settingsController.keybinds[? argument0];

if (!ds_exists(bindList, ds_type_list)) {
    addConsoleMessage("warning", "Tried to set keybind for non-existing control");
    exit;
}

var baseBind = getBaseBind();

var requiredBind = baseBind + argument2;
if (requiredBind < 0 || requiredBind > 3) {
    addConsoleMessage("warning", "Tried to set keybind that isn't keyboard main, keyboard secondary, gamepad main or gamepad secondary: " + string(requiredBind));
    exit;
}

var newBindList = ds_list_create();

for (var i = 0; i < 4; ++i) {
    var bind;
    if (i != requiredBind) {
        bind = bindList[| i];
    } else {
        bind = argument1;
    }

    ds_list_add(newBindList, bind);
}

ds_map_replace_list(settingsController.keybinds, argument0, newBindList);

