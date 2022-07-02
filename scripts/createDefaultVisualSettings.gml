///@description Creates default visual settings map
///@arg ds_map defaultVisualSettings

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on createDefaultKeybinds: " + string(argument_count));
    exit;
}

if (is_undefined(argument0) || !ds_exists(argument0, ds_type_map)) {
    addConsoleMessage("warning", "Bad argument on createDefaultKeybinds. Expected ds_map, got " + string(typeof(argument0)));
    exit;
}

ds_map_add(argument0, "width", display_get_width());
ds_map_add(argument0, "height", display_get_height());

ds_map_add(argument0, "guiScalingX", 1);
ds_map_add(argument0, "guiScalingY", 1);

ds_map_add(argument0, "framerate", 60);

