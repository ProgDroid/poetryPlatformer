/// menuSetGUI

for (var i = 0; i < SETTINGS_MENU_LIST_LENGTH; ++i) {
    var yOffset = (i - floor(SETTINGS_MENU_LIST_LENGTH * 0.5)) * MENU_LIST_Y_OFFSET;

    var baseX = (display_get_gui_width() * 0.5) + menuController.menuListXOffset;
    var baseY = (display_get_gui_height() * 0.5) + yOffset;

    if (i == currentOption) {
        draw_line_width(
            baseX - menuController.underlineHalfLength,
            baseY + 65,
            baseX + menuController.underlineHalfLength,
            baseY + 65,
            5
        );
    }

    draw_text_transformed(
        baseX,
        baseY,
        settingsMenuOptions[i],
        1,
        1,
        0
    );
}

