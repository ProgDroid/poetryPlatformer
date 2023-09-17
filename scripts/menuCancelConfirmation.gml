/// menuCancelConfirmation()

if (!ds_stack_empty(menuController.previousMenus) && ds_stack_top(menuController.previousMenus) == MENU_HANDLE_SET) {
    revertSettings();
}

var handle = menuController.confirmationHandle;
menuController.confirmationHandle = noone;

transitionOut(TRANSITION_HANDLE_OUT, menuController.menuConfirmationDirectionCancel, handle);

