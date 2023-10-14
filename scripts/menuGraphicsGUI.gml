/// menuGraphicsGUI()

drawPreviousMenu();

var currentOptions = getMenuOptions();
var lineLengths    = getMenuLineLengths();

drawSubMenuOptions(currentOptions, lineLengths);

draw_set_halign(fa_center);

var defaultAlpha = true;
var originalAlpha = draw_get_alpha();

for (var i = 0; i < menuController.menuOptionCount; ++i) {
    defaultAlpha = dimDisabledOption(currentOptions[| i], defaultAlpha, originalAlpha);

    var yOffset = (i - floor(menuController.menuOptionCount * 0.5)) * MENU_LIST_Y_OFFSET;

    var baseX = display_get_gui_width() * 0.75;
    var baseY = (display_get_gui_height() * 0.5) + yOffset;

    var text = getGraphicsOptionValue(currentOptions[| i]);

    if (i == menuController.subMenuSelected) {
        var left  = "  ";
        var right = "  ";

        if (menuController.subMenuArrowLeft) {
            left = "< ";
        }

        if (menuController.subMenuArrowRight) {
            right = " >";
        }

        text = left + string(menuController.subMenuInput) + right;
    }

    draw_text_transformed(
        baseX,
        baseY,
        text,
        0.4,
        0.4,
        0
    );

    if (i == menuController.currentOption && text != "") {
        draw_line_width(
            baseX - menuController.subMenuValueUnderlineHalfLength,
            baseY + 40,
            baseX + menuController.subMenuValueUnderlineHalfLength,
            baseY + 40,
            5
        );
    }
}

if (defaultAlpha == false) {
    draw_set_alpha(originalAlpha);
    defaultAlpha = true;
}
