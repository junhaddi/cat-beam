pauseSurf = surface_create(GAME_WIDTH, GAME_HEIGHT);
surface_set_target(pauseSurf);
draw_clear_alpha(c_white, 0);
surface_reset_target();

surface_copy(pauseSurf, 0, 0, application_surface);
pauseSprite = sprite_create_from_surface(pauseSurf, 0, 0, GAME_WIDTH, GAME_HEIGHT, false, false, 0, 0);

instance_deactivate_all(true);
