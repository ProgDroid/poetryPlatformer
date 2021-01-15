///refreshGuiValues

if (!instance_exists(GUIController)) {
    addConsoleMessage("warning", "GUIController doesn't exists");
    exit;
}

GUIController.alarm[0] = 1;

