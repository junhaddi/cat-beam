var playerSprite;
switch (petKind) {
	case 0:
		playerSprite = spr_pet1;
		break;
}

if (!isDead) {
	// 펫
	var _w = random_range(0.8, 1.2);
	var _h = random_range(0.8, 1.2);
	var _a = isRescue ? (obj_player.isDamaged ? 0.5 : 1) : 1; 
	draw_sprite_ext(playerSprite, -1, x, y, _w * isRescue ? 1 : -1, _h, 0, c_white, _a);

	// 고양이빔
	if (beamThickness > 1) {
		gpu_set_blendmode(bm_add);
		draw_set_color(c_yellow);
		draw_rectangle(x + beamOffsetX, y + beamOffsetY - beamThickness, x + beamOffsetX + beamRange, y + beamOffsetY + beamThickness, false);
		draw_set_color(c_white);
		gpu_set_blendmode(bm_normal);
	}
} else {
	// 펫 사망
	draw_sprite_ext(playerSprite, -1, x, y, isRescue ? 1 : -1, -1, 0, c_white, 1);
}
