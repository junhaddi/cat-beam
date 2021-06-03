function scr_player() {
	// 입력 관리
	var key_jump = false;
	var key_beam = false; 
	if (!isDead) {
		key_jump = keyboard_check_pressed(vk_up);
		key_beam = keyboard_check(vk_down);
	}
	
	vspd += grav;
	
	// 점프
	if (key_jump && jumpCount > 0 && (jumpCount == jumpCountMax ? place_meeting(x, y + 1, obj_solid) : true)) {
		vspd = jumpPower;
		jumpCount--;
	}
	
	// 고양이 비비ㅣㅣ비ㅣ비ㅇ비비이이ㅣㅣㅣㅣㅣㅣ이밈ㅁ!!
	if (!isDead) {
		isBeam = key_beam;
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
