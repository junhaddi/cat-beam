if (!isDead) {
	global.stringBallCount++;
	global.gameScore += other._score;
	instance_destroy(other);
}
