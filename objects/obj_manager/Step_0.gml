// TODO 점수 공식 필요
global.gameScore += 1;

// TODO 방어력 공식
global.hp -= (1 / room_speed);

// Parallax 배경
 layer_hspeed ( "bg_ground", -20 * global.gameSpeed);
 layer_hspeed ( "bg_city", -12 * global.gameSpeed);
 layer_hspeed ( "bg_sky", -4 * global.gameSpeed);
 
 // 게임 일시정지
if (keyboard_check_pressed(vk_escape)) {
	layer_hspeed ( "bg_ground", 0);
	layer_hspeed ( "bg_city", 0);
	layer_hspeed ( "bg_sky", 0);
	
	instance_create_layer(0, 0, "layer_inst", obj_pause);
}

// Darw
var hpbarSpriteWidth = sprite_get_width(spr_hpbar);
hpbarWidth = scr_ease(hpbarWidth, hpbarSpriteWidth * (global.hp / global.hpMax));


// 디버그
if (keyboard_check_pressed(vk_f5)) {
	game_restart();
}
