///@description eventFire
///@arg event
///@arg instance (optional)

if (ds_map_exists(notificationController.events, argument[0])) {
    var listenerList = notificationController.events[? argument[0]];
    
    var length = ds_list_size(listenerList);
    var listenerInfo, listener, script;
    var args = noone;

    for (var i = length - 1; i >= 0; i--) {
        listenerInfo = listenerList[| i];
        listener     = listenerInfo[0];
        script       = listenerInfo[1];

        var lenArgs = array_length_1d(listenerInfo) - 2;
        
        if (lenArgs > 0) {
            args = array_create(lenArgs);
            array_copy(args, 0, listenerInfo, 2, lenArgs);
        }
        
        if (instance_exists(listener)) {
            if (argument_count == 1 || // broadcast to all
                (argument_count == 2 && listener == argument[1])) { // only to specified instance
                with(listener) script_execute(script, args);
            }
        } else {
            eventUnregister(argument[0], listener);
        }
    }
}

