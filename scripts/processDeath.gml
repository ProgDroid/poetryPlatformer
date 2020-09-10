///@description process player death
takeDamage();

if (hp > 0) {
    x = xstart;
    y = ystart;
    stateSwitch("respawn");
} else if (hp <= 0) {
    gameOverScreen();
    stateSwitch("gameOver");
}

