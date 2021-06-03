scr_player();

if (global.hp < 1) {
	// 죽을 때 폴짝 뜀
	if (!isDead) {
		vspd = jumpPower;
	}
	isDead = true;
}

if (isBeam) {
	beamThickness = scr_ease(beamThickness, beamThicknessMax + random(10));
} else {
	beamThickness = scr_ease(beamThickness, 0);
}
