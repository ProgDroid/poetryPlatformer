///spawnLetters(string <collectible>)

var phrase       = worldController.collectiblesPhrases[? argument[0]];
var stringLength = string_length(phrase);
var spacing      = stringLength * 50;

for (var i = 0; i < stringLength; i++) {
    var char = string_lower(string_char_at(phrase, i + 1));
    if (char == " ") {
        continue;
    }

    letterObject = instance_create(x - (spacing / 2) + (50 * i), y - 50, objCollectibleLetter);
    letterObject.character   = char;
    letterObject.startFrame  = (ord(char) - ord('a')) * 13;
    letterObject.endFrame    = letterObject.startFrame + 12;
    letterObject.zoomFactor  = (i + 1.5);
    letterObject.image_index = letterObject.startFrame;
}
