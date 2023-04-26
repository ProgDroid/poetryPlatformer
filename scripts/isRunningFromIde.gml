///isRunningFromIde()
///@return bool

var isFromIde = sign(string_pos("gamemaker", parameter_string(0))) && sign(string_pos("studio", parameter_string(0))) && sign(string_pos("Runner.exe", parameter_string(0)));

return isFromIde;

