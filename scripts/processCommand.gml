///@description Process a console command
///@arg command string

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on processCommand: " + string(argument_count) + " (oh the irony!)");
}

if (argument[0] == "" || string_replace_all(argument[0], ' ', '') == "") {
    exit;
}

if (argument[0] == "warning") {
    addConsoleMessage("warning", "this is a test warning");
}

