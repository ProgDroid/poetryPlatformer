/// acceptNewKeybind()

var notAllowedKeys;
notAllowedKeys[5] = gp_axisrv;
notAllowedKeys[4] = gp_axisrh;
notAllowedKeys[3] = gp_axislv;
notAllowedKeys[2] = gp_axislh;
notAllowedKeys[1] = mb_left;
notAllowedKeys[0] = vk_escape;

var lastKey = getLastPressed();

if (lastKey == noone) {
    exit;
}

if (lastKey == vk_escape) {
    quitSubMenu();
    exit;
}

for (var i = 0; i < array_length_1d(notAllowedKeys); ++i) {
    if (notAllowedKeys[i] == lastKey) {
        quitSubMenu();
        exit;
    }
}

var currentOptions = getMenuOptions();
var currentOption  = currentOptions[| menuController.currentOption];
setKeybind(currentOption, lastKey, menuController.currentBind);
quitSubMenu();

