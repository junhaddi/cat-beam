if (!global.isFever) {
	scr_playerDamaged();
} else {
	global.gameScore += other._score;
	instance_destroy(other);
}
