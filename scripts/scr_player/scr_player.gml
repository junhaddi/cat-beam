function scr_player() {
	// 입력 관리
	var key_jump = false;
	var key_beam = false; 
	
	if (!isDead) {
		key_jump = keyboard_check_pressed(vk_up);
		key_beam = keyboard_check(vk_down);
	}
	
	// 중력 가속도
	vspd = min(vspd + grav, vspdMax);
	
	// 점프
	if (key_jump && jumpCount > 0 && (jumpCount == jumpCountMax ? place_meeting(x, y + 1, obj_solid) : true)) {
		vspd = jumpPower;
		jumpCount--;
	}
	
	if (!isDead) {
		// 고양이 비비ㅣㅣ비ㅣ비ㅇ비비이이ㅣㅣㅣㅣㅣㅣ이밈ㅁ!!
		isBeam = key_beam;
		
		// 빔 길이 설정
		if (isBeam) {
			beamRange = global.beamRangeMax;
			if (instance_number(par_enemy) > 0) {
				while (collision_line(x + beamOffsetX, y + beamOffsetY, x + beamOffsetX + beamRange, y + beamOffsetY, par_enemy, false, false) != noone && beamRange > 1) {
					beamRange--;
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
