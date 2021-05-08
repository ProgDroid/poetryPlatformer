///@description Validate the visual settings file
///@arg ds_map  visualSettings
///@arg ds_map  defaultVisualSettings
///@return bool Was visual settings map modified

var modified = false;

for (var i = ds_map_find_first(argument1); !is_undefined(i); i = ds_map_find_next(argument1, i)) {
    if (is_undefined(argument0[? i])) {
        ds_map_add(argument0, i, argument1[? i]);
        modified = true;
    }
}

return modified;

