function scr_enemyDamaged(enemys, index) {
	enemys[| index].hp -= global.beamDamage;
	if (enemys[| index].hp < 1) {
		instance_destroy(enemys[| index]);
	}
}
