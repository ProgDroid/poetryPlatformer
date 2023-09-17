/// getPreviousMenuLineLengths()

var previousMenuHandle = ds_stack_top(menuController.previousMenus);

var currentMenu = menuController.menus[? previousMenuHandle];
return currentMenu[? "lineLengths"];

