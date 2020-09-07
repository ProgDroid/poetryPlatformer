///@description
///@arg damage (optional)

var damage = 1;

if (argument_count == 1) {
    damage = argument[0];
}

hp -= damage;

