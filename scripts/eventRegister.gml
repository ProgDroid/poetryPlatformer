///@description eventRegister
///@arg event
///@arg id
///@arg script
///@arg arg1...*

var listenerList = noone;

if (!ds_map_exists(notificationController.events, argument[0])) {
    listenerList = ds_list_create();
    
    ds_map_add_list(notificationController.events, argument[0], listenerList);
} else {
    listenerList = notificationController.events[? argument[0]];
}

var listenerInfo;

listenerInfo[0] = argument[1]; // id

var length = argument_count; // ignore event and id

for (var i = 1; i < length - 1; i++) {
    listenerInfo[i] = argument[i + 1];
}

ds_list_add(listenerList, listenerInfo);

