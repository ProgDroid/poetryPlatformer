/// menuBack()

if (ds_stack_empty(menuController.previousMenus)) {
    return 0;
}

var menu = ds_stack_top(menuController.previousMenus);

transitionOut(TRANSITION_HANDLE_BACK_OUT, transitionDirection.up, menu);

