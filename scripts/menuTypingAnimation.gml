/// menuTypingAnimation

if (menuController.typingBuffer > 0) {
    menuController.typingBuffer -= 1;
    exit;
}

var letterCount = menuController.typingProgress;
var loops       = menuController.menuOptionCount;
var typed       = false;

for (i = 0; i < loops; ++i) {
    var length = string_length(menuController.menuGUIOptions[i]);
    if (letterCount > length) {
        letterCount -= length;
        continue;
    }

    typed = true;
    menuController.typingArray[i] = string_copy(menuController.menuGUIOptions[i], 1, letterCount);
    break;
}

if (!typed) {
    menuController.menuCursorAction = selectMenuOption;
    menuController.menuMove         = menuController.nextMenuMove;
    menuController.menuAnimation    = menuController.menuAnimationNext;
    menuController.currentOption    = menuController.nextOption;
    menuController.offsetFromCentre = 1;
    exit;
}

menuController.typingProgress++;
menuController.typingBuffer = MENU_TYPING_BUFFER + (random(5) - 2);

