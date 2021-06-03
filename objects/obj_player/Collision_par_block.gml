if (!isDamaged) {
	global.hp -= other.damage;
	isDamaged = true;
	alarm[Player.Damaged] = damagedTimeMax;
}
