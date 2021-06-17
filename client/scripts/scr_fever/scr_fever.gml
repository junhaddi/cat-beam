function scr_fever() {
	// 중력 가속도
	vspd += grav * global.gameSpeed;
	vspd = clamp(vspd, -vspdMax, vspdMax);
	
	if (!isDead) {
		// 고양이 비비ㅣㅣ비ㅣ비ㅇ비비이이ㅣㅣㅣㅣㅣㅣ이밈ㅁ!!
		beamRange = beamRangeMax;
		if (instance_number(par_enemy) > 0) {
			// 적 공격
			var enemys = ds_list_create();
			if (collision_line_list(x + beamOffsetX, y + beamOffsetY, x + beamOffsetX + beamRange, y + beamOffsetY, par_enemy, false, false, enemys, false) != noone) {
				for (var i = 0; i < ds_list_size(enemys); i++) {
					scr_enemyDamaged(enemys, i);
				}
			}
			ds_list_destroy(enemys);
		}
	
		// 물리엔진
		if (place_meeting(x, y + vspd, obj_solid)) {
			vspd = jumpPower * global.gameSpeed;
		}
	}
	y += vspd;
}
