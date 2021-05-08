///@description Cancel dash

applyTimeFactor(timeFactorController.timeFactor + (1 - timeFactorController.timeFactor) * 0.5 * timeFactorController.timeFactor * timeFactorController.pauseFactor);

if (timeFactorController.timeFactor >= 1) {
    applyTimeFactor(1);
    dash = dashCheck;
    die  = dieScript;

    if (state_name == "idle") {
        panOutAlarmIndex = createAlarm(viewController, TICK_RATE * 5, setPanOut);
    }
}

