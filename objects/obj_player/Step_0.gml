scr_player();

if (isBeam) {
	beamThickness = scr_ease(beamThickness, beamThicknessMax + random(10), hspeed);
} else {
	beamThickness = scr_ease(beamThickness, 0, hspeed);
}
