///stateDashCancelled

if (state_new) {
    state_new = false;
    viewController.zoomIn    = false;
    flashController.dashDark = false;
}

script_execute(collectStuff);

applyTimeFactor(timeFactorController.timeFactor + (1 - timeFactorController.timeFactor) * 0.5 * timeFactorController.timeFactor);

if (timeFactorController.timeFactor >= 1) {
    applyTimeFactor(1);
    stateSwitchPrevious();
}

animations();

script_execute(facingDirection);

script_execute(moveVertical);

script_execute(moveHorizontal);

// collisions
verticalCollisions();

script_execute(slideAlongWalls);

horizontalCollisions();

if (jumpBuffer > 0) {
    jumpBuffer -= 1;
}

if (jumpPressed) {
    jumpBuffer = MAXJUMPBUFFER;
    script_execute(doubleJump);
}

script_execute(land);

script_execute(die);
