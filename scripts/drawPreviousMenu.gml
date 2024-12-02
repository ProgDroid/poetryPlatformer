/// drawPreviousMenu()

var options     = getPreviousMenuOptions();
var count       = ds_list_size(options);
var selected    = ds_stack_top(menuController.previousSelectedOptions);
var lineLengths = getPreviousMenuLineLengths();

draw_set_alpha(menuController.previousMenuAlpha);

var defaultAlpha = true;
var originalAlpha = draw_get_alpha();

for (var i = 0; i < count; ++i) {
    defaultAlpha = dimDisabledOption(options[| i], defaultAlpha, originalAlpha);

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

if (defaultAlpha == false) {
    draw_set_alpha(originalAlpha);
    defaultAlpha = true;
}

draw_set_alpha(menuController.menuAlpha);
draw_set_halign(fa_left);

