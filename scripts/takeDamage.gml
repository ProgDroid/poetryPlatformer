///@description
///@arg damage (optional)

var damage = 1;

if (argument_count == 1) {
    if (argument[0] == 0) {
        addConsoleMessage("warning", "Passed 0 damage to takeDamage script, which should not be possible");
    }

    damage = argument[0];
}

hp -= damage;

