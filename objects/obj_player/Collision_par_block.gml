if (!isDamaged) {
	global.hp--;
	isDamaged = true;
	alarm[Player.Damaged] = damagedTimeMax;
}
