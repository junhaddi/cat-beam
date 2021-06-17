scr_fever();

if (!global.isFever && !isDead) {
	// 죽을 때 폴짝 뜀
	vspd = jumpPower;
	beamThickness = 0;
	isBeam = false;
	isDead = true;
}

if (isBeam) {
	beamThickness = scr_ease(beamThickness, beamThicknessMax + random(10));
} else {
	beamThickness = scr_ease(beamThickness, 0);
}
	
if (bbox_top > GAME_HEIGHT) {
	instance_destroy();
}
