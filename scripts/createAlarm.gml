///@description Create new alarm
///@arg instance
///@arg time
///@arg script
///@arg overrideTimeFactor

if (argument_count != 4) {
    addConsoleMessage("warning", "Bad argument count on createAlarm: " + string(argument_count));
    return noone;
}

if (!instance_exists(argument0)) {
    addConsoleMessage("warning", "Bad argument on createAlarm. Instance " + string(argument0) + " does not exist");
    return noone;
}

if (!is_real(argument1)) {
    addConsoleMessage("warning", "Bad argument type on createAlarm. Expected <instance, real, script, bool>, got <instance, " + string(typeof(argument1)) + ", script, bool>");
    return noone;
}

if (!script_exists(argument2)) {
    addConsoleMessage("warning", "Bad argument on createAlarm. Script " + string(argument2) + " does not exist");
    return noone;
}

if (argument3 != 1 && argument3 != 0) {
    addConsoleMessage("warning", "Bad argument on createAlarm. Bool (1 or 0) required, " + string(argument3) + " provided");
    return noone;
}

if (!ds_queue_empty(alarmController.availableIndices)) {
    var index = ds_queue_dequeue(alarmController.availableIndices);

    alarmController.instances[index]          = argument0;
    alarmController.alarmTimes[index]         = argument1;
    alarmController.scripts[index]            = argument2;
    alarmController.timeFactorOverride[index] = argument3;

    return index;
}

addConsoleMessage("No available indices!");
return noone;
