///doubleJumpScript

if (state_timer <= doubleJumpTime) {
    exit;
}

verticalSpeed = -maxVerticalSpeed;
doubleJump    = emptyScript;
image_index   = 0;
drawingScaleX = 0.75 - 0.05;
drawingScaleY = 1.35 + 0.05;
image_speed   = 0;
alarm[3]      = room_speed * 1;
viewController.offsetVertically = false;

eventFire(allEvents.doublejump);

stateSwitch("drop");

