hintSurface = surface_create(GAME_WIDTH, GAME_HEIGHT);
hintAlpha = 0;
hintTarget = -1;

surface_set_target(hintSurface);
draw_clear_alpha(c_black, 0);
surface_reset_target();

global.tutorialIndex = Tutorial.Hello;
_isStop = false;
isItems = false;

alarm[global.tutorialIndex] = GAME_FPS * 4;
