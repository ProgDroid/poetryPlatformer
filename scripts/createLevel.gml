///@description Create a level
///@arg <string> Level handle

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on createLevel: " + string(argument_count));
    exit;
}

var file = file_text_open_read(working_directory + "\levels\" + argument[0] + ".txt");

if (file == -1) {
    addConsoleMessage("warning", "Level not found");
    exit;
}

draw_set_font(esteban);

var lines;
var lineIndex       = 0;
var maxLineWidth    = 0;
var maxLineHeight   = 0;
var maxStringLength = 0;

while (!file_text_eof(file)) {
    lines[lineIndex] = file_text_readln(file);
    maxLineWidth     = max(maxLineWidth, string_width(lines[lineIndex]));
    maxLineHeight    = max(maxLineHeight, string_height(lines[lineIndex]));
    maxStringLength  = max(maxStringLength, string_length(lines[lineIndex]) - 1);
    lineIndex++;
}

draw_set_font(esteban);

var width  = maxLineWidth * 350 / 75;
var height = (maxLineHeight + 400) * (lineIndex + 1);

var levelRoom = room_add();
room_set_width(levelRoom, width);
room_set_height(levelRoom, height);
room_set_persistent(levelRoom, false);

file_text_close(file);

draw_set_font(-1);

addConsoleMessage("info", "Created " + argument[0] + " with dimensions " + string(width) + "x" + string(height));

room_goto(levelRoom);

room_instance_add(levelRoom, 32, 32, fixedTimestepRoom);
room_instance_add(levelRoom, 32, 32, worldController);
room_instance_add(levelRoom, 32, 32, particlesController);

var positionX;

var listIndex        = -1;
var collectible      = false;
var collectiblePlace = false;
var player           = false;

platformController.wordIndex = array_create(0);

for (var i = 0; i < array_length_1d(lines); i++) {
    positionX  = 0;
    listIndex += 1;
    
    var previousChar = noone;

    for (var j = 1; j < string_length(lines[i]); j++) {
        var char = string_upper(string_char_at(lines[i], j));
        
        if (char == "\") {
            collectible = !collectible;
            continue;
        }
        
        if (char == "/") {
            collectiblePlace = !collectiblePlace;
            continue;
        }
        
        if (char == "@") {
            player = !player;
            continue;
        }
        
        if (char == " " || char == "") {
            var originalX = positionX;

            positionX = originalX + 350 * 0.91;

            if (previousChar != noone) {
                positionX = originalX + 350 * 0.5;
            }

            listIndex += 1;
            
            previousChar = noone;

            continue;
        }

        var object = platformController.platformMap[? char];

        if (!is_real(object)) {
            continue;
        }

        var instanceX = positionX + 50 + platformController.paddingXMap[? char];
        var instanceY = (((height - 400) / array_length_1d(lines)) * i) + 200 + maxLineHeight + platformController.paddingYMap[? char];

        var instance = room_instance_add(levelRoom, instanceX, instanceY, object);

        platformController.wordIndex[array_length_1d(platformController.wordIndex)] = listIndex;
        platformController.collectibleIndices[array_length_1d(platformController.collectibleIndices)] = collectible;

        if (player) {
            room_instance_add(levelRoom, instanceX + sprite_get_width(object_get_sprite(object)) * 0.25, instanceY - sprite_get_height(object_get_sprite(object)) * PLATFORMSCALE - 10, objPlayer);
        }
        
        if (collectiblePlace) {
            room_instance_add(levelRoom, instanceX + platformController.triggerXMap[? char] * PLATFORMSCALE, instanceY + platformController.triggerYMap[? char] * PLATFORMSCALE, objCollectYokan);
        }

        positionX = instanceX + sprite_get_width(object_get_sprite(object)) * PLATFORMSCALE;

        previousChar = char;
    }
}

room_set_view(levelRoom, 0, true, 0, 0, 960, 540, 0, 0, window_get_width(), window_get_height(), 0, 0, 0, 0, -1);
room_set_view_enabled(levelRoom, true);

