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
	// 플레이어
	var _w = random_range(0.8, 1.2);
	var _h = random_range(0.8, 1.2);
	draw_sprite_ext(playerSprite, -1, x, y, _w, _h, 0, c_white, isDamaged ? 0.5 : 1);

	// 고양이빔
	if (beamThickness > 1) {
		draw_set_color(c_yellow);
		draw_rectangle(x + beamOffsetX, y + beamOffsetY - beamThickness, x + beamOffsetX + beamRange, y + beamOffsetY + beamThickness, false);
		draw_set_color(c_white);
	}
} else {
	// 플레이어 사망
	draw_sprite_ext(playerSprite, -1, x, y, 1, -1, 0, c_white, 1);
}
