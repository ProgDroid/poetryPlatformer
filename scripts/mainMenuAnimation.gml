/// mainMenuAnimation

var rotation = lerp(menuController.asteriskRotation, menuController.asteriskRotationGoal, 0.2);
var diff     = abs(rotation - menuController.asteriskRotationGoal);

if (diff != 0 && diff < 0.5) {
    rotation = menuController.asteriskRotationGoal;
}

menuController.asteriskRotation = rotation;

for (var i = menuOptionCount - 1; i >= 0; --i) {
    for (var j = 1; j >= 0; --j) {
        menuController.mainMenuOptionScale[i, j] = lerp(
            mainMenuOptionScale[i, j],
            1 - ((i - menuController.currentOption + menuOptionCount) % menuOptionCount) * 0.166,
            0.3
        );
    }
}

handleUnderlineAnimation();

