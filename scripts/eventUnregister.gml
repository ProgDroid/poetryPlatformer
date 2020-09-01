///@decription eventUnregister
///@arg event
///@arg id

if (ds_map_exists(notificationController.events, argument[0])) {
    var listenerList = notificationController.events[? argument[0]];
    var length       = ds_list_size(listenerList);
    
    for (var i = 0; i < length; i++) {
        var listenerInfo = listenerList[| i];
        
        if (listenerInfo[0] == argument[1]) {
            if (length == 1) {
                ds_list_destroy(listenerList);
                ds_map_delete(notificationController.events, argument[0]);
            } else {
                ds_list_delete(listenerList, i);
            }
            break;
        }
    }
}
