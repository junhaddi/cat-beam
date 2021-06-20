pauseSurface = surface_create(GAME_WIDTH, GAME_HEIGHT);
surface_set_target(pauseSurface);
draw_clear_alpha(c_black, 0);
surface_reset_target();

surface_copy(pauseSurface, 0, 0, application_surface);
pauseSprite = sprite_create_from_surface(pauseSurface, 0, 0, GAME_WIDTH, GAME_HEIGHT, false, false, 0, 0);
surface_free(pauseSurface);

instance_deactivate_all(true);
