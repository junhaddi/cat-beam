var playerSprite;
switch (petKind) {
	case 0:
		playerSprite = spr_pet1;
		break;
	case 1:
		playerSprite = spr_pet2;
		break;
	case 2:
		playerSprite = spr_pet3;
		break;
}

if (!isDead) {
	var _w = random_range(0.8, 1.2) * isRescue ? 1 : -1;
	var _h = random_range(0.8, 1.2);
	var alpha = isRescue ? (obj_player.isDamaged ? 0.5 : 1) : 1; 
	draw_sprite_ext(playerSprite, -1, x, y, _w, _h, 0, c_white, alpha);

	// 고양이빔
	if (beamThickness > 1) {
		gpu_set_blendmode(bm_add);
		draw_set_color(beamColor);
		draw_rectangle(x + beamOffsetX, y + beamOffsetY - beamThickness, x + beamOffsetX + beamRange, y + beamOffsetY + beamThickness, false);
		draw_set_color(c_white);
		gpu_set_blendmode(bm_normal);
	}
} else {
	// 펫 사망
	draw_sprite_ext(playerSprite, -1, x, y, isRescue ? 1 : -1, -1, 0, c_white, 1);
}
