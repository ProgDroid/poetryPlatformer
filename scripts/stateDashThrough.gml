///stateDashThrough

if (state_new) {
    state_new = false;
    viewController.zoomIn    = false;
    flashController.dashDark = false;
}

if (place_meeting(x, y, objCollectible)) {
    stateSwitch("inCollectionAnimation");
}

show_debug_message("dashed through! woooo");

applyTimeFactor(1);
stateSwitchPrevious();

