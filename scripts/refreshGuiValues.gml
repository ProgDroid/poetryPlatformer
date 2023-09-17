///refreshGuiValues

var widthValue  = display_get_gui_width();
var heightValue = display_get_gui_height();

animationIndex    = 0;
gameOver          = false;
healthbarPosition = widthValue * HEALTH_BAR_POSITION_FACTOR;
centreX           = widthValue / 2;
centreY           = heightValue / 2;
fontScaling       = 0.1 * heightValue / FONT_SCALING;
offsetX           = (1 - settingsController.visualSettings[? "guiScalingX"]) * widthValue * 0.5;
offsetY           = (1 - settingsController.visualSettings[? "guiScalingY"]) * heightValue * 0.5;

