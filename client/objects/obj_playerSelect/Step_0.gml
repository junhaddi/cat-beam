if (global.gameState == GameState.PlayerSelect) {
	if (position_meeting(mouse_x, mouse_y, self)) {
		// Mouse Enter
		var imageScale = 1.2;
		image_xscale = scr_ease(image_xscale, imageScale);
		image_yscale = scr_ease(image_yscale, imageScale);
	} else {
		// Mouse Leave
		image_xscale = scr_ease(image_xscale, 1);
		image_yscale = scr_ease(image_yscale, 1);
	}
	visible = true;
} else {
	visible = false;
}

