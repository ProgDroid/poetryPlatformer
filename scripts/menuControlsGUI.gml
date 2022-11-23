/// menuControlsGUI()

drawPreviousMenu();

var currentOptions = getMenuOptions();
var lineLengths    = getMenuLineLengths();

drawSubMenuOptions(currentOptions, lineLengths);

draw_set_halign(fa_center);

for (var i = 0; i < menuController.menuOptionCount; ++i) {
    var yOffset = (i - floor(menuController.menuOptionCount * 0.5)) * MENU_LIST_Y_OFFSET;

    var baseX1 = display_get_gui_width() * 0.7;
    var baseX2 = display_get_gui_width() * 0.85;
    var baseY  = (display_get_gui_height() * 0.5) + yOffset;

    draw_text_transformed(
        baseX1,
        baseY,
        getControlsHandleFromOption(currentOptions[| i], 0),
        0.4,
        0.4,
        0
    );

    draw_text_transformed(
        baseX2,
        baseY,
        getControlsHandleFromOption(currentOptions[| i], 1),
        0.4,
        0.4,
        0
    );
}

