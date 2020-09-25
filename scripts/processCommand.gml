///@description Process a console command
///@arg command string

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on processCommand: " + string(argument_count) + " (oh the irony!)");
}

if (argument[0] == "" || string_replace_all(argument[0], ' ', '') == "") {
    exit;
}

if (argument[0] == "help") {
    var commands = "";
    commands += "warning";
    commands += ", flash";
    commands += ", dark";
    commands += ", blur";
    commands += ", die";
    addConsoleMessage("info", "Available commands are: " + commands);
}

if (argument[0] == "warning") {
    addConsoleMessage("warning", "this is a test warning");
}

if (argument[0] == "flash") {
    addConsoleMessage("info", "AHAAAA");
    flashController.dark   = false;
    flashController.active = true;
    toggleDevConsole();
}

if (argument[0] == "dark") {
    addConsoleMessage("info", "embrace the darkness");
    flashController.dark   = !flashController.dark;
    toggleDevConsole();
}

if (argument[0] == "blur") {
    toggleDevConsole();
    postProcessingController.blur = true;
}

if (argument[0] == "die") {
    toggleDevConsole();
    objPlayer.hp = 1;
    eventFire(allEvents.playerfell);
}

