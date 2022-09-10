/// drawTypedMenuList(bool outline)

var outline = argument0;

for (var i = 0; i < menuController.menuOptionCount; ++i) {
    var yOffset = (i - floor(menuController.menuOptionCount * 0.5)) * MENU_LIST_Y_OFFSET;

    var baseX = (display_get_gui_width() * 0.5) + menuController.menuListXOffset;
    var baseY = (display_get_gui_height() * 0.5) + yOffset;

    if (i == menuController.currentOption) {
        draw_line_width(
            baseX - menuController.underlineHalfLength,
            baseY + 65,
            baseX + menuController.underlineHalfLength,
            baseY + 65,
            5 + (outline * 1)
        );
    }

    draw_text_transformed(
        baseX,
        baseY,
        menuController.typingArray[i],
        1 + (outline * 0.02),
        1 + (outline * 0.02),
        0
    );
}

