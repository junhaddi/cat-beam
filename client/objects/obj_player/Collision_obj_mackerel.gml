if (!isDead) {
	var mackerel = other.isGrilled ? 3 : 1; 
	global.mackerelCount += mackerel;
	instance_destroy(other);
}
