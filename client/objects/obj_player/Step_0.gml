if (path_position == 1) {
	scr_player();

	if (global.hp < 1 && !isDead) {
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
}
