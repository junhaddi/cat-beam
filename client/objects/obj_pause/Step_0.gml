if (global.platform == Platform.PC ? keyboard_check_pressed(vk_escape) : mouse_check_button_pressed(mb_left)) {
	surface_free(pauseSurf);
	sprite_delete(pauseSprite);
	instance_activate_all();
	instance_destroy();
}
