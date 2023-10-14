/// drawTypedMenuList()

var options = getMenuOptions();

var defaultAlpha = true;
var originalAlpha = draw_get_alpha();

for (var i = 0; i < menuController.menuOptionCount; ++i) {
    defaultAlpha = dimDisabledOption(options[| i], defaultAlpha, originalAlpha);

    var yOffset = (i - floor(menuController.menuOptionCount * 0.5)) * MENU_LIST_Y_OFFSET;

    var baseX = (display_get_gui_width() * 0.5) + menuController.menuListXOffset;
    var baseY = (display_get_gui_height() * 0.5) + yOffset;

    if (i == menuController.currentOption) {
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
        menuController.typingArray[i],
        1,
        1,
        0
    );
}

if (defaultAlpha == false) {
    draw_set_alpha(originalAlpha);
    defaultAlpha = true;
}

