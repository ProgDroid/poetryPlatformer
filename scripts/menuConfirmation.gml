/// menuConfirmation(transitionHandle, menuHandle, confirmationText)

if (argument_count != 3) {
    addConsoleMessage("warning", "Bad argument count on menuTransition: " + string(argument_count));
    exit;
}

menuController.confirmationHandle = argument1;
menuController.confirmationText   = argument2;
menuController.confirmationAlpha  = 0;

transitionOut(argument0, transitionDirection.down, MENU_HANDLE_CONFIRMATION);

