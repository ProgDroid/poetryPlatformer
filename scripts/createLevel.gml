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


var width  = maxLineWidth * PLATFORM_WIDTH / 75;
var height = (maxLineHeight + PLATFORM_HEIGHT) * (lineIndex + 1);

var levelRoom = room_duplicate(TODUPLICATE);
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
var playerX          = 0;
var playerY          = 0;
var parsedIndex      = false;
var collectibleName  = "";
var levelEnd         = false;

platformController.wordIndex         = array_create(0);
platformController.collectiblesNames = array_create(0);
platformController.collectiblesOrder = array_create(0);
platformController.collectibleMap    = array_create(MAXCOLLECTIBLES);

for (var i = 0; i < array_length_1d(lines); i++) {
    positionX  = 0;
    listIndex += 1;
    
    var previousChar = noone;

    for (var j = 1; j < string_length(lines[i]); j++) {
        var char = string_upper(string_char_at(lines[i], j));

        if (char == "`") {
            parsedIndex = !parsedIndex;
            continue;
        }

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

        if (levelEnd && char != "I" && char != "|") {
            addConsoleMessage("warning", "Level end trigger is not on i character");
            exit;
        }

        if (char == "|") {
            levelEnd = !levelEnd;
            continue;
        }

        if (char == " " || char == "") {
            var originalX = positionX;

            positionX = originalX + PLATFORM_WIDTH * 0.91;

            if (previousChar != noone) {
                positionX = originalX + PLATFORM_WIDTH * 0.5;
            }

            listIndex += 1;
            
            previousChar = noone;

            continue;
        }
        
        if (parsedIndex) {
            if (collectible) {
                platformController.collectibleMap[real(char) - 1]    = listIndex;
                platformController.collectiblesNames[real(char) - 1] = collectibleName;
                collectibleName = "";
            }
            
            if (collectiblePlace) {
                platformController.collectiblesOrder[array_length_1d(platformController.collectiblesOrder)] = real(char) - 1;
            }
            
            continue;
        }

        // how I miss ternary...
        var object = platformController.platformMap[? char];

        if (levelEnd) {
            object = platformController.platformMap[? "dotlessI"];
        }

        if (!is_real(object)) {
            continue;
        }

        var instanceX = positionX + 50 + platformController.paddingXMap[? char];
        var instanceY = (((height - PLATFORM_HEIGHT) / array_length_1d(lines)) * i) + 200 + maxLineHeight + platformController.paddingYMap[? char];

        var instance = room_instance_add(levelRoom, instanceX, instanceY, object);

        platformController.wordIndex[array_length_1d(platformController.wordIndex)] = listIndex;
        platformController.collectibleIndices[array_length_1d(platformController.collectibleIndices)] = collectible;

        if (collectible) {
            collectibleName = collectibleName + char;
        }

        if (player && !instance_exists(objPlayer)) {
            playerX = instanceX + sprite_get_width(object_get_sprite(object)) * 0.25;
            playerY = instanceY - sprite_get_height(object_get_sprite(object)) * PLATFORMSCALE - 10;

            room_instance_add(levelRoom, playerX, playerY, objPlayer);
        }

        if (collectiblePlace) {
            room_instance_add(levelRoom, instanceX + platformController.triggerXMap[? char] * PLATFORMSCALE, instanceY + platformController.triggerYMap[? char] * PLATFORMSCALE, objCollectible);
        }

        if (levelEnd) {
            room_instance_add(levelRoom, instanceX + platformController.triggerXMap[? "dotlessI"] * PLATFORMSCALE, instanceY + platformController.triggerYMap[? "dotlessI"] * PLATFORMSCALE, objLevelEnd);
        }

        positionX = instanceX + sprite_get_width(object_get_sprite(object)) * PLATFORMSCALE;

        previousChar = char;
    }
}

inputController.inputProcess = ingameInput;

viewController.viewXNoShift = playerX - viewController.originalWidth div 3;
viewController.viewYNoShift = playerY - viewController.originalHeight div 2;

room_set_view(
    levelRoom,
    0,
    true,
    viewController.viewXNoShift,
    viewController.viewYNoShift,
    viewController.originalWidth,
    viewController.originalHeight,
    0,
    0,
    settingsController.visualSettings[? "width"],
    settingsController.visualSettings[? "height"],
    0,
    0,
    0,
    0,
    -1
);
room_set_view_enabled(levelRoom, true);

