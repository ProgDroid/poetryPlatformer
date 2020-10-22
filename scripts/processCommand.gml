///@description Process a console command
///@arg command string

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on processCommand: " + string(argument_count) + " (oh the irony!)");
    exit;
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
    commands += ", spawn objectName <x> <y>";
    commands += ", createLevel <levelName>";
    commands += ", exit";
    commands += ", print <id> <property>";
    addConsoleMessage("info", "Available commands are: " + commands);
}

if (argument[0] == "warning") {
    addConsoleMessage("warning", "this is a test warning");
}

if (argument[0] == "flash") {
    addConsoleMessage("info", "AHAAAA");
    flashController.dark     = false;
    flashController.active   = true;
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

if (string_pos("spawn", argument[0]) != 0) {
    if (string_replace_all(argument[0], ' ', '') == "spawn") {
        addConsoleMessage("warning", "Please supply an object to spawn");
        exit;
    }
    
    var arguments  = string_delete(argument[0], 1, 6);
    var objectName = arguments;

    if (string_pos(" ", objectName) != 0) {
        var objectName = string_copy(arguments, 1, string_pos(" ", arguments) - 1);
    }
    
    if (objectName == "objPlayer") {
        addConsoleMessage("warning", "Don't try to spawn another player, please");
        exit;
    }
    
    if (asset_get_index(objectName) == -1) {
        addConsoleMessage("warning", "Object " + objectName + " does not exist");
        exit;
    }
    
    if (string_pos(" ", arguments) != 0) {
        var positions = string_delete(arguments, 1, string_length(objectName) + 1);
        var xPos      = string_copy(positions, 1, string_pos(" ", positions));
        var yPos      = string_delete(positions, 1, string_length(xPos));

        instance_create(real(xPos), real(yPos), asset_get_index(objectName));
    } else {
        instance_create(random(view_wview[0]), random(view_hview[0]), asset_get_index(objectName));
    }
}

if (string_pos("createLevel", argument[0]) != 0) {
    if (string_replace_all(argument[0], ' ', '') == "createLevel") {
        addConsoleMessage("warning", "Please supply a level to create");
        exit;
    }

    var arguments = string_delete(argument[0], 1, 12);
    
    createLevel(arguments);
}

if (argument[0] == "exit") {
    game_end();
}

if (string_pos("print", argument[0]) != 0) {
    if (string_replace_all(argument[0], ' ', '') == "print") {
        addConsoleMessage("warning", "Please supply <id> <property>");
        exit;
    }

    var arguments = string_delete(argument[0], 1, 6);
    
    if (string_pos(" ", arguments) == 0) {
        addConsoleMessage("warning", "Please supply <id> <property>");
        exit;
    }
    
    var givenId   = string_copy(arguments, 1, string_pos(" ", arguments) - 1);
    var property  = string_delete(arguments, 1, string_pos(" ", arguments));
    
    if (!variable_instance_exists(givenId, property)) {
        addConsoleMessage("warning", "Property " + property + " does not exists in " + object_get_name(givenId.object_index) + " with id " + givenId);
        exit;
    }
    
    var toPrint   = variable_instance_get(givenId, property);
    
    addConsoleMessage("info", string(toPrint));
}

