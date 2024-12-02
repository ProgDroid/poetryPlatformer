///saveSettingsToDisk(string fileName, string fileContents)

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count in saveSettingsToDisk: " + string(argument_count));
    exit;
}

var file = file_text_open_write(working_directory + argument0);
file_text_write_string(file, argument1);
file_text_close(file);

