/// menuConfirmationTypeIn()

menuController.confirmationAlpha = min(1, menuController.confirmationAlpha + MENU_FADE_STEP);

menuTypeInConfirmationTypingArray();

if (menuController.typingProgress == 0 && menuController.typingBuffer == TYPING_BUFFER) {
    menuController.confirmationAlpha = 1;
}

