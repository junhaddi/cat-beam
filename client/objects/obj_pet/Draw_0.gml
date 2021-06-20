var petSprite, _petSprite;

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

switch (petKind) {
	case 0:
		_petSprite = "spr_player1";
		break;
	case 1:
		_petSprite = "spr_player2";
		break;
	case 2:
		_petSprite = "spr_player3";
		break;
}

petSprite = asset_get_index(_petSprite + "_" + state);
image_speed = !global.isStop ? global.gameSpeed : 0;
image_xscale = isRescue ? 0.5 : -0.5;
image_yscale = 0.5;
	
if (!isDead) {
	var alpha = isRescue ? (obj_player.isDamaged ? 0.5 : 1) : 1; 
	draw_sprite_ext(petSprite, -1, x, y, image_xscale, image_yscale, state == "roll" ? -current_time * global._gameSpeed : 0, c_white, alpha);

	// 고양이빔
	if (beamThickness > 1 && beamRange > 1) {
		gpu_set_blendmode(bm_add);
		draw_set_color(beamColor);
		draw_rectangle(x + beamOffsetX, y + beamOffsetY - beamThickness, x + beamOffsetX + beamRange, y + beamOffsetY + beamThickness, false);
		draw_set_color(c_white);
		gpu_set_blendmode(bm_normal);
	}
} else {
	// 펫 사망
	draw_sprite_ext(petSprite, 0, x, y, isRescue ? image_xscale : -image_xscale, -image_yscale, 0, c_white, 1);
}
