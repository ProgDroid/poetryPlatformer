/// drawTypedMenuListHorizontal()

draw_set_alpha(menuController.confirmationAlpha);

draw_text_transformed(
    (display_get_gui_width() * 0.5),
    (display_get_gui_height() * 0.33),
    menuController.confirmationText,
    1,
    1,
    0
);

draw_set_alpha(menuController.menuAlpha);

for (var i = 0; i < menuController.menuOptionCount; ++i) {
    if (menuController.menuOptionCount == 2) {
        var xOffset = sign(i * 2 - 1) * 300;
    } else {
        var xOffset = (i - floor(menuController.menuOptionCount * 0.5)) * 300;
    }

    var baseX = (display_get_gui_width() * 0.5) + xOffset;
    var baseY = (display_get_gui_height() * 0.67);

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
        0.8,
        0.8,
        0
    );
}

