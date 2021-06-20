function scr_drawTextBorder(_x, _y, text, textColor, borderColor, thickness) {
	draw_set_halign(fa_center);
	for (var i = 1; i <= thickness; i++) {
		draw_set_color(borderColor);
		draw_text(_x + i, _y, text);
		draw_text(_x, _y - i, text);
		draw_text(_x - i, _y, text);
		draw_text(_x, _y + i, text);
		draw_set_color(textColor);
		draw_text(_x, _y, text);
		draw_set_color(c_white);
	}
	draw_set_halign(fa_left);
}