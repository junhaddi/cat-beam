if (path_position == 1) {
	scr_player();

	if (global.hp <= 0 && !isDead) {
		// 죽을 때 폴짝 뜀
		vspd = jumpPower;
		beamThickness = 0;
		isBeam = false;
		isDamaged = false;
		isDead = true;
	}
	
	// 고양이빔
	if (isBeam) {
		beamThickness = scr_ease(beamThickness, beamThicknessMax + random(10));
	} else {
		beamThickness = scr_ease(beamThickness, 0);
	}
}
