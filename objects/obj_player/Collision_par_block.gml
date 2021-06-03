if (!isDamaged) {
	global.hp -= other.damage;
	isDamaged = true;
	alarm[PlayerAlarm.Damaged] = damagedTimeMax;
}
