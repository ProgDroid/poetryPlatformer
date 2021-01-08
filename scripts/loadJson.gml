///loadJson(string fileName)
///@return map

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on loadJson: " + string(argument_count));
    exit;
}

if (file_exists(argument0)) {
    var file   = buffer_load(argument0);
    var output = buffer_read(file, buffer_string);
    buffer_delete(file);
    return json_decode(output);
}

addConsoleMessage("warning", "File " + argument0 + " not found");

return noone;

