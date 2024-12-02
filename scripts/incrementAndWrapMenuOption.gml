/// incrementAndWrapMenuOption(held)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on incrementAndWrapMenuOption: " + string(argument_count));
    exit;
}

var option      = menuController.currentOption;
var optionCount = menuController.menuOptionCount;

option += argument0;
option = option % optionCount + (optionCount * (option < 0));

return option;

