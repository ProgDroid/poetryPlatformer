///drawPressToCancelPrompt()

var key1 = getControlsHandleFromOption("start", 0);
var key2 = getControlsHandleFromOption("start", 1);

var keyString = key1;

if (key2 != "None") {
    keyString += " or " + key2;
}

draw_text_transformed(
    display_get_gui_width() * 0.5,
    display_get_gui_height() * 0.95,
    "Press " + keyString + " to cancel",
    0.25,
    0.25,
    0
);

