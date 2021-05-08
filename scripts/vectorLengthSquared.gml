///@description Length of a vector
///@args x, y, z, w...
///@return length

if (argument_count < 2) {
    addConsoleMessage("warning", "Bad argument count on vector2Length: " + string(argument_count));
    exit;
}

var lengthSquared = 0;

for (var i = 0; i < argument_count; ++i) {
    lengthSquared += argument[i] * argument[i];
}

return lengthSquared;

