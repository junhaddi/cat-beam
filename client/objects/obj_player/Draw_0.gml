var playerSprite;
switch (global.playerKind) {
	case 0:
		playerSprite = spr_player1;
		break;
	case 1:
		playerSprite = spr_player2;
		break;
	case 2:
		playerSprite = spr_player3;
		break;
}

if (!isDead) {
	var _w = random_range(0.8, 1.2);
	var _h = random_range(0.8, 1.2);
	var _a;
	if (instance_exists(obj_pet)) {
		if (obj_pet.isDead) {
			_a = 0.5;
		} else {
			_a = 1;
		}
	} else {
		if (isDamaged) {
			_a = 0.5;
		} else {
			_a = 1;
		}
	}
	draw_sprite_ext(playerSprite, -1, x, y, _w, _h, 0, c_white, _a);

	// 고양이빔
	if (beamThickness > 1) {
		gpu_set_blendmode(bm_add);
		draw_set_color(beamColor);
		draw_rectangle(x + beamOffsetX, y + beamOffsetY - beamThickness, x + beamOffsetX + beamRange, y + beamOffsetY + beamThickness, false);
		draw_set_color(c_white);
		gpu_set_blendmode(bm_normal);
	}
} else {
	// 플레이어 사망
	draw_sprite_ext(playerSprite, -1, x, y, 1, -1, 0, c_white, 1);
}
