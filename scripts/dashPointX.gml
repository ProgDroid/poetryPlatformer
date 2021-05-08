///@description Check X of mouse or dash aim point

var pointXMouse   = (inputController.currentInputType == inputmethod.keyboard) * mouse_x;

var pointXPad     = (inputController.currentInputType == inputmethod.pad) * (inputController.playerDashAimLeft + inputController.playerDashAimRight) * max(objPlayer.dashTraceLength, 20);
    pointXPad    += (inputController.currentInputType == inputmethod.pad) * objPlayer.x;

return pointXMouse + pointXPad;

