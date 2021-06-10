if (isRescue) {
	scr_pet();

	if ((global.petHp < 1 || global.hp < 1) && !isDead) {
		// 죽을 때 폴짝 뜀
		vspd = jumpPower;
		isDead = true;
		isDamaged = false;
	}

	if (isBeam) {
		beamThickness = scr_ease(beamThickness, beamThicknessMax + random(10));
	} else {
		beamThickness = scr_ease(beamThickness, 0);
	}
} else {
	x -= _speed * global.gameSpeed;
}

if (bbox_right < 0 || bbox_top > GAME_HEIGHT) {
	instance_destroy();
}
