function scr_playerDamaged(){
	if (!isDamaged) {
		global.hp -= other.damage;
		isDamaged = true;
		alarm[PlayerAlarm.Damaged] = damagedTimeMax;
	}
}
