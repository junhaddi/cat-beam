if (!isDead) {
	var mackerel = other.isGrilled ? 3 : 1; 
	global.mackerelCount += mackerel;
	global.gameScore += other._score;
	instance_destroy(other);
}
