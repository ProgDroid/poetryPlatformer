/// drawSubMenuOptions(array currentOptions, array lineLengths)

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on drawSubMenuOptions: " + string(argument_count));
    exit;
}

var currentOptions = argument0;
var lineLengths    = argument1;

for (var i = 0; i < menuController.menuOptionCount; ++i) {
    var yOffset = (i - floor(menuController.menuOptionCount * 0.5)) * MENU_LIST_Y_OFFSET;

    var baseX = display_get_gui_width() * 0.5;
    var baseY = (display_get_gui_height() * 0.5) + yOffset;

    var lineX = baseX + lineLengths[| i];

    if (lineX == baseX) {
        lineX = display_get_gui_width() * 0.875;
    }

    if (i == menuController.currentOption) {
        draw_line_width(
            baseX - 20,
            baseY + 40,
            lineX,
            baseY + 40,
            5
        );
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
