/// confirmationTypeIn()

menuController.confirmationAlpha = 0;
menuController.menuAlpha = 1;

for (i = menuController.menuOptionCount - 1; i >= 0; --i) {
    menuController.typingArrayConfirmation[i] = "";
}

menuTransition(menuConfirmationTypeIn);

