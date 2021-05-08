///@description Validate the keybinds settings file
///@arg ds_map  keybinds
///@arg ds_map  defaultKeybinds
///@return bool Was keybinds map modified

var modified = false;

for (var i = ds_map_find_first(argument1); !is_undefined(i); i = ds_map_find_next(argument1, i)) {
    if (is_undefined(argument0[? i])) {
        var newList = ds_list_create();
        ds_list_copy(newList, argument1[? i]);

        ds_map_add_list(argument0, i, newList);
        modified = true;
    }
}

return modified;

