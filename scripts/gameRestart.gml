///@description Restart the game after a game over
applyTimeFactor(1);

GUIController.gameOver = false;
draw_set_font(-1);
draw_set_halign(fa_left);

cancelAllAlarms();

postProcessingController.blur = false;
application_surface_draw_enable(true);

room_restart();

