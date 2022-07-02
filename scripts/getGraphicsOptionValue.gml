/// getGraphicsOptionValue(string option)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on getGraphicsOptionValue: " + string(argument_count));
    return "";
}

if (argument0 == "framerate") {
    return string(settingsController.visualSettings[? "framerate"]);
}

if (argument0 == "resolution") {
    var resX = settingsController.visualSettings[? "width"];
    var resY = settingsController.visualSettings[? "height"];

    return string(resX) + "x" + string(resY);
}

return "";
