/// mainMenuAnimation

var rotation = lerp(menuController.asteriskRotation, menuController.asteriskRotationGoal, 0.2);
var diff     = abs(rotation - menuController.asteriskRotationGoal);

if (diff != 0 && diff < 0.5) {
    rotation = menuController.asteriskRotationGoal;
}

menuController.asteriskRotation = rotation;

for (var i = MENU_OPTION_COUNT - 1; i >= 0; --i) {
    for (var j = 1; j >= 0; --j) {
        menuController.menuOptionScale[i, j] = lerp(
            menuOptionScale[i, j],
            1 - ((i - menuController.currentOption + MENU_OPTION_COUNT) % MENU_OPTION_COUNT) * 0.166,
            0.3
        );
    }
}

handleUnderlineAnimation();

