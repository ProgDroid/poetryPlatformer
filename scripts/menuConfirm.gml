/// menuConfirm()

var handle = menuController.confirmationHandle;
menuController.confirmationHandle = noone;

transitionOut(TRANSITION_HANDLE_OUT, transitionDirection.down, handle);

