/// mainMenuGUI

draw_sprite_ext(
    platformAsteriskMenu,
    0,
    display_get_gui_width() * 0.5,
    display_get_gui_height() * 0.5,
    asteriskSize,
    asteriskSize,
    asteriskRotation,
    c_black,
    asteriskAlpha * menuController.menuAlpha
);

for (var i = 0; i < menuController.menuOptionCount; ++i) {
    var angle = degtorad(120 - (i * 60) + asteriskRotation);

    var lineBaseX = (display_get_gui_width() * 0.5) + (cos(angle) * MENU_RADIUS);
    var lineY     = (display_get_gui_height() * 0.5) + (-sin(angle) * MENU_RADIUS) + 65;

    if (i == menuController.currentOption) {
        draw_line_width(
            lineBaseX - menuController.underlineHalfLength,
            lineY,
            lineBaseX + menuController.underlineHalfLength,
            lineY,
            5
        );
    }

    draw_text_transformed(
        (display_get_gui_width() * 0.5) + (cos(angle) * (MENU_RADIUS - (1 - menuController.menuOptionScale[i, 0]) * 150) * menuController.offsetFromCentre),
        (display_get_gui_height() * 0.5) + (-sin(angle) * (MENU_RADIUS - (1 - menuController.menuOptionScale[i, 1]) * 150) * menuController.offsetFromCentre),
        menuController.menuGUIOptions[i],
        menuController.menuOptionScale[i, 0],
        menuController.menuOptionScale[i, 1],
        0
    );
}

