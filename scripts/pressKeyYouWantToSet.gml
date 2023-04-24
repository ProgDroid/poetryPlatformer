///pressKeyYouWantToSet()

draw_set_font(esteban);
draw_set_colour(c_black);
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);

draw_text_transformed(
    display_get_gui_width() * 0.5,
    display_get_gui_height() * 0.4,
    "Press any key to set for",
    0.6,
    0.6,
    0
);

var currentOptions = getMenuOptions();

draw_text_transformed(
    display_get_gui_width() * 0.5,
    display_get_gui_height() * 0.55,
    currentOptions[| menuController.currentOption],
    0.75,
    0.75,
    0
);

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