///@description Propagate shadow effect on word when landing on platform
///@arg Whether to add or remove shadow (alarm 0 to add, alarm 1 to remove)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on propagateShadowEffect: " + argument_count);
    exit;
}

var loops = instance_number(objPlatforms);

for (var i = selfIndex + 1; i < loops; i++) {
    if (platformController.wordIndex[i] != platformController.wordIndex[selfIndex]) {
        break;
    }

    var instance = instance_find(objPlatforms, i);
    instance.alarm[argument[0]]     = room_speed * 0.2 * abs(i - selfIndex);
    instance.alarm[1 - argument[0]] = -1;
}

for (var i = selfIndex - 1; i >= 0; i--) {
    if (platformController.wordIndex[i] != platformController.wordIndex[selfIndex]) {
        break;
    }
    
    var instance = instance_find(objPlatforms, i);
    instance.alarm[argument[0]]     = room_speed * 0.2 * abs(i - selfIndex);
    instance.alarm[1 - argument[0]] = -1;
}

