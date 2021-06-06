if (!isDead) {
	if (global.hp + other.heal > global.hpMax) {
		global.hp = global.hpMax;
	} else {
		global.hp += other.heal;
	}

	instance_destroy(other);
}
