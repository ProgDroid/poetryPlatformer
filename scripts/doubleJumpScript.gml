///doubleJumpScript

verticalSpeed = -maxVerticalSpeed;
doubleJump    = noJump;
image_index   = 0;
drawingScaleX = 0.75 - 0.05;
drawingScaleY = 1.35 + 0.05;
image_speed   = 0;

viewController.offsetVertically = false;
cancelAlarm(offsetVertAlarmIndex, setOffsetVertically);
offsetVertAlarmIndex            = createAlarm(viewController, TICK_RATE, setOffsetVertically);

eventFire(allEvents.doublejump);

stateSwitch("drop");

