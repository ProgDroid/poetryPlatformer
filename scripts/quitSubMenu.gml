/// quitSubMenu()

menuController.subMenuInput     = noone;
menuController.subMenuSelected  = -1;
menuController.menuMove         = asset_get_index(getMenuMove());
menuController.menuGUI          = asset_get_index(getMenuDraw());
menuController.menuCursorAction = selectMenuOption;
menuController.subMenuInputMove = emptyScript;

