if (global.platform == Platform.PC ? keyboard_check_pressed(vk_escape) : mouse_check_button_pressed(mb_left)) {
	sprite_delete(pauseSprite);
	instance_activate_all();
	instance_destroy();
}
