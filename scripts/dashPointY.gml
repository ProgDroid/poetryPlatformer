///@description Check Y of mouse or dash aim point

var pointYMouse   = (inputController.currentInputType == inputmethod.keyboard) * mouse_y;

var pointYPad     = (inputController.currentInputType == inputmethod.pad) * (inputController.playerDashAimUp + inputController.playerDashAimDown) * max(objPlayer.dashTraceLength, 20);
    pointYPad    += (inputController.currentInputType == inputmethod.pad) * objPlayer.y;

return pointYMouse + pointYPad;

