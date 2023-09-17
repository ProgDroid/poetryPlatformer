/// getPreviousMenuOption()

var previousMenuHandle = ds_stack_top(menuController.previousMenus);

var previousMenu = menuController.menus[? previousMenuHandle];
return previousMenu[? "options"];

