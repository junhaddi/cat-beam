draw_sprite(pauseSprite, 0, 0, 0);

draw_set_color(c_black)
draw_set_alpha(0.5);
draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
draw_set_alpha(1);
draw_set_color(c_white)
draw_text(GAME_CENTER, GAME_MIDDLE, "일시정지");
