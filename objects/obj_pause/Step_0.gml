if (keyboard_check_pressed(vk_escape)) {
	surface_free(pauseSurf);
	sprite_delete(pauseSprite);
	instance_activate_all();
	instance_destroy();
}
