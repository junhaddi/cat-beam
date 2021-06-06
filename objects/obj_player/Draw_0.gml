// 플레이어
if (!isDead) {
	var _w = random_range(0.8, 1.2);
	var _h = random_range(0.8, 1.2);
	draw_sprite_ext(sprite_index, image_index, x, y, _w, _h, image_angle, image_blend, isDamaged ? 0.5 : 1);

	// 고양이빔
	if (beamThickness > 1) {
		draw_set_color(c_yellow);
		draw_rectangle(x + beamOffsetX, y + beamOffsetY - beamThickness, x + beamOffsetX + beamRange, y + beamOffsetY + beamThickness, false);
		draw_set_color(c_white);
	}
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, 1, -1, image_angle, image_blend, image_alpha);
}
