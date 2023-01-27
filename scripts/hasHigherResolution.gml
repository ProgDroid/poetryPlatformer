/// hasHigherResolution(string currentResolution)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on hasHigherResolution: " + string(argument_count));
    return false;
}

var index = ds_list_find_index(menuController.resolutions[? "resolutions"], argument0);

return index < ds_list_size(menuController.resolutions[? "resolutions"]) - 1;
