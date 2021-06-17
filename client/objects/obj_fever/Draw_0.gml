var feverSprite;
switch (feverKind) {
	case 0:
		feverSprite = spr_player1;
		break;
	case 1:
		feverSprite = spr_player2;
		break;
	case 2:
		feverSprite = spr_player3;
		break;
}

if (!isDead) {
	var _w = random_range(0.8, 1.2);
	var _h = random_range(0.8, 1.2);
	draw_sprite_ext(feverSprite, -1, x, y, _w, _h, 0, c_white, 1);

	// 고양이빔
	if (beamThickness > 1) {
		gpu_set_blendmode(bm_add);
		draw_set_color(beamColor);
		draw_rectangle(x + beamOffsetX, y + beamOffsetY - beamThickness, x + beamOffsetX + beamRange, y + beamOffsetY + beamThickness, false);
		draw_set_color(c_white);
		gpu_set_blendmode(bm_normal);
	}
} else {
	// 피버타임 종료
	draw_sprite_ext(feverSprite, -1, x, y, 1, -1, 0, c_white, 1);
}
