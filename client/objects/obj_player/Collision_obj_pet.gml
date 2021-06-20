if (global.petHp == 0 && !other.isRescue && !other.isDead) {
	global.petHp = 2;
	other.isRescue = true;
}
