/// animateMenu

var rotation = lerp(menuController.asteriskRotation, menuController.asteriskRotationGoal, 0.2);

if (abs(rotation - menuController.asteriskRotationGoal) < 0.5) {
    rotation = menuController.asteriskRotationGoal;
}

menuController.asteriskRotation = rotation;

