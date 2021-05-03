///@description Apply a change in time factor
///@arg float timeFactor

if (argument[0] < 0) {
    addConsoleMessage("warning", "Negative time factor on applyTimeFactor");
    exit;
}

timeFactorController.timeFactor = argument[0];

refreshImageSpeeds();

