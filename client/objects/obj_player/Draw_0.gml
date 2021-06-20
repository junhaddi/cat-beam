var playerSprite, _playerSprite;

if (!isDead) {
	if (isGround) {
		state = "run";
	} else {
		if (vspd < 0) {
			if (jumpCount > 0) {
				state = "up";
			} else {
				state = "roll";
			}
		} else if (vspd > 1) {
			state = "down";
		}
	}
} else {
	state = "run";
}

switch (global.playerKind) {
	case 0:
		_playerSprite = "spr_player1";
		break;
	case 1:
		_playerSprite = "spr_player2";
		break;
	case 2:
		_playerSprite = "spr_player3";
		break;
}

playerSprite = asset_get_index(_playerSprite + "_" + state);
image_speed = !global.isStop ? global.gameSpeed : 0;

if (!isDead) {
	var alpha = global.petHp > 0 ? 1 : (isDamaged ? 0.5 : 1);
	draw_sprite_ext(playerSprite, -1, x, y, 1, 1, state == "roll" ? -current_time * global._gameSpeed : 0, c_white, alpha);

	// 고양이빔
	if (beamThickness > 1 && beamRange > 1) {
		gpu_set_blendmode(bm_add);
		draw_set_color(beamColor);
		draw_rectangle(x + beamOffsetX, y + beamOffsetY - beamThickness, x + beamOffsetX + beamRange, y + beamOffsetY + beamThickness, false);
		draw_set_color(c_white);
		gpu_set_blendmode(bm_normal);
	}
} else {
	// 플레이어 사망
	draw_sprite_ext(playerSprite, 0, x, y, 1, -1, 0, c_white, 1);
}
