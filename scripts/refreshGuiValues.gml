///refreshGuiValues

animationIndex    = 0;
gameOver          = false;
healthbarPosition = display_get_gui_width() * 0.025;
centreX           = display_get_gui_width() / 2;
centreY           = display_get_gui_height() / 2;
fontScaling       = 0.1 * display_get_gui_height() / 203;
offsetX           = display_get_gui_width() - display_get_gui_width() * settingsController.visualSettings[? "guiScalingX"];
offsetY           = display_get_gui_height() - display_get_gui_height() * settingsController.visualSettings[? "guiScalingY"];

