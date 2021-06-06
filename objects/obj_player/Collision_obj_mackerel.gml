if (!isDead) {
	var mackerel = other.isGrilled ? 3 : 1; 
	if (global.mackerelCount + mackerel >= 5) {
		// TODO FEVER!@
		global.mackerelCount = 0;
	} else {
		global.mackerelCount += mackerel;
	}
	
	instance_destroy(other);
}
