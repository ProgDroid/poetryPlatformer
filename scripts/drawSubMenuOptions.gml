/// drawSubMenuOptions(array currentOptions, array lineLengths)

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on drawSubMenuOptions: " + string(argument_count));
    exit;
}

var currentOptions = argument0;
var lineLengths    = argument1;

var defaultAlpha = true;
var originalAlpha = draw_get_alpha();

for (var i = 0; i < menuController.menuOptionCount; ++i) {
    defaultAlpha = dimDisabledOption(currentOptions[| i], defaultAlpha, originalAlpha);

    var yOffset = (i - floor(menuController.menuOptionCount * 0.5)) * MENU_LIST_Y_OFFSET;

    var baseX = display_get_gui_width() * 0.5;
    var baseY = (display_get_gui_height() * 0.5) + yOffset;
    var lineX = baseX + lineLengths[| i] - 20;

    if (i == menuController.currentOption) {
        draw_set_halign(fa_center);

        draw_line_width(
            lineX - menuController.subMenuUnderlineHalfLength,
            baseY + 40,
            lineX + menuController.subMenuUnderlineHalfLength,
            baseY + 40,
            5
        );

        draw_set_halign(fa_left);
    }

    draw_text_transformed(
        baseX,
        baseY,
        currentOptions[| i],
        0.6,
        0.6,
        0
    );
}

if (defaultAlpha == false) {
    draw_set_alpha(originalAlpha);
    defaultAlpha = true;
}

