///menuTypeInConfirmationTypingArray()

if (menuController.typingBuffer > 0) {
    menuController.typingBuffer -= 1;
    exit;
}

var letterCount = menuController.typingProgress;
var loops       = menuController.menuOptionCount;
var typed       = false;

var options = getMenuOptions();

for (i = 0; i < loops; ++i) {
    var length = string_length(options[| i]);
    if (letterCount > length) {
        letterCount -= length;
        continue;
    }

    typed = true;
    menuController.typingArrayConfirmation[i] = string_copy(options[| i], 1, letterCount);
    break;
}

if (!typed) {
    menuController.offsetFromCentre = 1;
    menuController.typingBuffer     = TYPING_BUFFER;
    menuController.typingProgress   = 0;
    transitionInEnd();
    exit;
}

menuController.typingProgress++;
menuController.typingBuffer = MENU_TYPING_BUFFER + (random(5) - 2);

