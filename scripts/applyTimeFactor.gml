///@description Apply a change in time factor
///@arg float timeFactor

if (argument[0] < 0) {
    addConsoleMessage("warning", "Negative time factor on applyTimeFactor");
}

timeFactorController.timeFactor = argument[0];

refreshImageSpeeds();

