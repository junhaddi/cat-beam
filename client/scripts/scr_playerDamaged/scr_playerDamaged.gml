function scr_playerDamaged(){
	if (!isDamaged) {
		if (global.petHp > 0) {
			global.petHp--;
		} else {
			global.hp -= other.damage;
		}
		isDamaged = true;
		alarm[PlayerAlarm.Damaged] = damagedTimeMax;
	}
}
