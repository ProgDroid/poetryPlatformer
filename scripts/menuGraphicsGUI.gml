/// menuGraphicsGUI()

drawPreviousMenu();

var currentOptions = getMenuOptions();
var lineLengths    = getMenuLineLengths();

drawSubMenuOptions(currentOptions, lineLengths);

draw_set_halign(fa_center);

for (var i = 0; i < menuController.menuOptionCount; ++i) {
    var yOffset = (i - floor(menuController.menuOptionCount * 0.5)) * MENU_LIST_Y_OFFSET;

    var baseX = display_get_gui_width() * 0.75;
    var baseY  = (display_get_gui_height() * 0.5) + yOffset;

    draw_text_transformed(
        baseX,
        baseY,
        getGraphicsOptionValue(currentOptions[| i]),
        0.4,
        0.4,
        0
    );
}
