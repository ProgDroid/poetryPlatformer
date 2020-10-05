///@description Round up to next highest power of 2
///@arg <real>

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on nextPower2: " + string(argument_count));
    exit;
}

return 1 << ceil(log2(argument[0]));

