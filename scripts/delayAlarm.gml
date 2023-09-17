///@description Delay an alarm by a given amount of time
///@arg int index
///@arg int time
///@arg script

if (argument_count != 3) {
    addConsoleMessage("warning", "Bad argument count on delayAlarm: " + string(argument_count));
    exit;
}

if (!is_real(argument0)) {
    addConsoleMessage("warning", "Bad argument on cancelAlarm. Expected <id, time, script>, got <" + string(typeof(argument0)) + ", time, script>");
    exit;
}

if (!is_real(argument1) || argument1 < 1) {
    addConsoleMessage("warning", "Bad argument on cancelAlarm. Expected <id, time, script>, got <id, " + string(typeof(argument1)) + ", script>");
    exit;
}

if (!script_exists(argument2)) {
    addConsoleMessage("warning", "Bad argument on cancelAlarm. Script does not exist");
    exit;
}

if (argument0 == noone || alarmController.scripts[argument0] != argument2) {
    exit;
}

alarmController.alarmTimes[argument0] += abs(argument1);

