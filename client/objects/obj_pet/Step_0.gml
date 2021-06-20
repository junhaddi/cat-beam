if (isRescue) {
	scr_pet();

	if ((global.petHp <= 0 || global.hp <= 0) && !isDead) {
		// 죽을 때 폴짝 뜀
		vspd = jumpPower;
		beamThickness = 0;
		isBeam = false;
		isDead = true;
	}

	if (isBeam) {
		beamThickness = scr_ease(beamThickness, beamThicknessMax + random(5));
	} else {
		beamThickness = scr_ease(beamThickness, 0);
	}
} else {
	x -= _speed * global.gameSpeed;
}

if (bbox_right < 0 || bbox_top > GAME_HEIGHT) {
	instance_destroy();
}
