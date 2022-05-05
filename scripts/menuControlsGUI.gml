var options     = getPreviousMenuOptions();
var count       = ds_list_size(options);
var selected    = ds_stack_top(menuController.previousSelectedOptions);
var lineLengths = getPreviousMenuLineLengths();

draw_set_alpha(menuController.previousMenuAlpha);

for (var i = 0; i < count; ++i) {
    var yOffset = (i - floor(count * 0.5)) * MENU_LIST_Y_OFFSET;

    var baseX = (display_get_gui_width() * 0.5) + menuController.menuListXGoal;
    var baseY = (display_get_gui_height() * 0.5) + yOffset;

    if (i == selected) {
        draw_line_width(
            baseX - lineLengths[| i],
            baseY + 65,
            baseX + lineLengths[| i],
            baseY + 65,
            5
        );
    }

    draw_text_transformed(
        baseX,
        baseY,
        options[| i],
        1,
        1,
        0
    );
}

draw_set_alpha(menuController.menuAlpha);
draw_set_halign(fa_left);

var currentOptions = getMenuOptions();

for (var i = 0; i < menuController.menuOptionCount; ++i) {
    var yOffset = (i - floor(menuController.menuOptionCount * 0.5)) * MENU_LIST_Y_OFFSET;

    var baseX = display_get_gui_width() * 0.5;
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
        currentOptions[| i],
        0.6,
        0.6,
        0
    );
}

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
