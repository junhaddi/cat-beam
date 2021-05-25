function scr_player() {
	// 입력 관리
	var key_jump = keyboard_check(vk_up);
	var key_beam = keyboard_check(vk_down);
	
	vspd += grav;
	
	// 점프
	if (key_jump && place_meeting(x, y + 1, obj_solid)) {
		vspd = jumpPower;
	}
	
	// 레이저 비비ㅣㅣ비ㅣ비ㅇ비비이이ㅣㅣㅣㅣㅣㅣ이밈ㅁ!!
	if (key_beam) {
	
	}
	
	// 물리엔진
	if (place_meeting(x, y + vspd, obj_solid)) {
		while (!place_meeting(x, y + sign(vspd), obj_solid)) {
			y += sign(vspd);
		}
		vspd = 0;
	}
	y += vspd;
}
