/// dimDisabledOption(string option, bool defaultAlpha, real originalAlpha)
/// @returns bool defaultAlpha

if (argument_count != 3) {
    addConsoleMessage("warning", "Bad argument count on dimDisabledOption: " + string(argument_count));
    return argument1;
}

var defaultAlpha = argument1;

for (var j = 0; j < array_length_1d(menuController.menuDisabledEntries); ++j) {
    if (argument0 == menuController.menuDisabledEntries[j]) {
        if (argument1 == true) {
            draw_set_alpha(0.5 * argument2);
            defaultAlpha = false;
        }

        break;
    } else {
        draw_set_alpha(argument2);
        defaultAlpha = true;
    }
}

return defaultAlpha;

