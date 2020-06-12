///stateExecute()
if(script_exists(state)) {
    script_execute(state)
} else {
    stateSwitch(ds_map_find_first(state_map));
}
