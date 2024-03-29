///@description Process existing alarms

for (var i = MAX_ALARMS - 1; i >= 0; --i) {
    if (alarmTimes[i] == noone) {
        continue;
    }

    alarmTimes[i] = max(0, alarmTimes[i] - (timeFactorController.timeFactor * timeFactorController.pauseFactor * 1));

    if (alarmTimes[i] == 0) {
        var instance  = instances[i];
        var script    = scripts[i];
        cancelAlarm(i, script);

        with (instance) {
            script_execute(script);
        }
    }
}

