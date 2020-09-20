///@description Add a message to the console
///@arg string Type
///@arg string Message

var message;

if (argument_count < 2) {
    message[consoleCommands.type] = "warning";
    message[consoleCommands.str]  = "Bad argument count on addConsoleMessage: " + string(argument_count) + " (oh the irony!)";
} else {
    message[consoleCommands.type] = argument[0];
    message[consoleCommands.str]  = argument[1];
}

if (devModeController.historySize == devModeController.maxHistorySize) {
    ds_list_delete(devModeController.history, 0);
    devModeController.historySize -= 1;
}

ds_list_add(devModeController.history, message);
devModeController.historySize += 1;

if (argument[0] == "command") {
    processCommand(argument[1]);
}

show_debug_message(message[consoleCommands.str]);

