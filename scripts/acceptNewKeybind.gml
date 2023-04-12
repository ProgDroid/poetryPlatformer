/// acceptNewKeybind()

var notAllowedKeys = [
    vk_escape,
    mb_left,
    gp_axislh,
    gp_axislv,
    gp_axisrh,
    gp_axisrv
];

var lastKey = getLastPressed();

if (lastKey == noone) {
    return;
}

if (lastKey == vk_escape) {
    quitSubMenu();
    return;
}

for (var i = 0; i < array_length_1d(notAllowedKeys); ++i) {
    if (notAllowedKeys[i] == lastKey) {
        quitSubMenu();
        return;
    }
}

// TODO set keybind here

// TODO quitSubMenu exits the whole submenu, not just setting the key
quitSubMenu();

