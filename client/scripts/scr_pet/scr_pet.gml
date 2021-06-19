function scr_pet() {
	// 입력 관리
	var key_jump = false;
	var key_beam = false; 
	
	if (!isDead) {
		key_jump = keyboard_check_pressed(vk_up) || global.isTouchs[Touch.Jump];
		key_beam = keyboard_check(vk_down) || global.isTouchs[Touch.Beam];
	}
	
	// 중력 가속도
	vspd += grav * global.gameSpeed;
	vspd = clamp(vspd, -vspdMax, vspdMax);
	
	// 점프
	if (key_jump && jumpCount > 0 && (jumpCount == jumpCountMax ? place_meeting(x, y + 1, obj_solid) : true)) {
		vspd = jumpPower * global.gameSpeed;
		jumpCount--;
	}
	
	if (!isDead) {
		// 고양이 비비ㅣㅣ비ㅣ비ㅇ비비이이ㅣㅣㅣㅣㅣㅣ이밈ㅁ!!
		isBeam = key_beam;
		
		if (isBeam) {
			beamRange = beamRangeMax;
			if (instance_number(par_enemy) > 0) {
				// 적 공격
				var enemys = ds_list_create();
				if (collision_line_list(x + beamOffsetX, y + beamOffsetY, x + beamOffsetX + beamRange, y + beamOffsetY, par_enemy, false, false, enemys, false) != noone) {
					if (isBeamStraight) {
						for (var i = 0; i < ds_list_size(enemys); i++) {
							scr_enemyDamaged(enemys, i);
						}
					} else if (enemys[| 0] != undefined) {
						scr_enemyDamaged(enemys, 0);
					}
				}
				ds_list_destroy(enemys);
				
				// 빔 길이 설정
				if (!isBeamStraight) {
					while (collision_line(x + beamOffsetX, y + beamOffsetY, x + beamOffsetX + beamRange, y + beamOffsetY, par_enemy, false, false) != noone && beamRange > 1) {
						beamRange--;
					}
				}
			}
		}
		
		// 순간적인 빔 두께 설정
		if (keyboard_check_pressed(vk_down)) {
			beamThickness = beamThicknessMax;
		}
	
		// 물리엔진
		if (place_meeting(x, y + vspd, obj_solid)) {
			while (!place_meeting(x, y + sign(vspd), obj_solid)) {
				y += sign(vspd);
			}
			vspd = 0;
			jumpCount = jumpCountMax;
		}
	}
	y += vspd;
}
