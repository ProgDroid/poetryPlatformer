/// menuConfirmation(transitionHandle, menuHandle, confirmationText, transitionDirectionCancel, transitionDirectionConfirm)

if (argument_count != 5) {
    addConsoleMessage("warning", "Bad argument count on menuTransition: " + string(argument_count));
    exit;
}

menuController.confirmationHandle               = argument1;
menuController.confirmationText                 = argument2;
menuController.confirmationAlpha                = 0;
menuController.menuConfirmationDirectionCancel  = argument3;
menuController.menuConfirmationDirectionConfirm = argument4;

transitionOut(argument0, transitionDirection.down, MENU_HANDLE_CONFIRMATION);

