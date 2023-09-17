///@description Cancel a given alarm
///@arg index

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on cancelAlarm: " + string(argument_count));
    return noone;
}

if (!is_real(argument0)) {
    addConsoleMessage("warning", "Bad argument on cancelAlarm. Expected <int, script>, got <" + string(typeof(argument0)) + ", script>");
    return noone;
}

if (!script_exists(argument1)) {
    addConsoleMessage("warning", "Bad argument on cancelAlarm. Script " + string(argument1) + " does not exist");
    return noone;
}

if (argument0 == noone || alarmController.scripts[argument0] != argument1) {
    return noone;
}

alarmController.instances[argument0]          = noone;
alarmController.alarmTimes[argument0]         = noone;
alarmController.scripts[argument0]            = noone;
alarmController.timeFactorOverride[argument0] = noone;

ds_queue_enqueue(alarmController.availableIndices, argument0);

return noone;

