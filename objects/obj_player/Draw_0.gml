// 플레이어
if (!isDead) {
	var _w = random_range(0.8, 1.2);
	var _h = random_range(0.8, 1.2);
	draw_sprite_ext(sprite_index, image_index, x, y, _w, _h, image_angle, image_blend, isDamaged ? 0.5 : 1);
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, 1, -1, image_angle, image_blend, image_alpha);
}


// 고양이빔
if (beamThickness > 1) {
	var offsetX = 30;
	var offsetY = 12;
	draw_set_color(c_yellow);
	draw_rectangle(x + offsetX, y + offsetY - beamThickness, x + offsetX + beamRange, y + offsetY + beamThickness, false);
	draw_set_color(c_white);
}
