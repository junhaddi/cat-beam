if (global.petHp == 0 && !other.isDead) {
	global.petHp = 2;
	other.isRescue = true;
	show_debug_message("GET");
}
