///doubleJumpScript

verticalSpeed = -maxVerticalSpeed;
doubleJump    = noJump;
image_index   = 0;
drawingScaleX = JUMP_TRANSFORM_X;
drawingScaleY = JUMP_TRANSFORM_Y;
image_speed   = 0;

viewController.offsetVertically = false;
cancelAlarm(offsetVertAlarmIndex, setOffsetVertically);
offsetVertAlarmIndex            = createAlarm(viewController, TICK_RATE, setOffsetVertically, false);

eventFire(allEvents.doublejump);

stateSwitch("drop");

