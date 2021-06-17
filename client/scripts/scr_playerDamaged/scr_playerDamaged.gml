function scr_playerDamaged() {
	if (!isDamaged) {
		if (global.petHp > 0) {
			global.petHp--;
		} else {
			global.hp -= max(10, other.damage - global.defence * 2);
		}
		isDamaged = true;
		alarm[PlayerAlarm.Damaged] = damagedTimeMax;
	}
}
