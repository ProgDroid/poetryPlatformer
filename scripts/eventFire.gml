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
            // if an id is specified, only run for object type that has matching id
            // while running for every other object type (might regret this but
            // better than supplying a list of ids and having to know everything that
            // needs to be told which negates the purpose of the events system)
            // won't work for multiple inheritance
            if (argument_count == 1 ||
                (argument_count == 2 &&
                 (listener.object_index != argument[1].object_index &&
                  object_get_parent(listener.object_index) != object_get_parent(argument[1].object_index)) ||
                 (listener.object_index == argument[1].object_index && listener == argument[1]))
            ) {
                with(listener) script_execute(script, args);
            }
        } else {
            eventUnregister(argument[0], listener);
        }
    }
}

