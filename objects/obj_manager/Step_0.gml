// TODO 점수 공식 필요
global.gameScore += 1;

// TODO 방어력 공식
global.hp -= (1 / room_speed);

// Darw
var hpbarSpriteWidth = sprite_get_width(spr_hpbar);
hpbarWidth = scr_ease(hpbarWidth, hpbarSpriteWidth * (global.hp / global.hpMax));

if (keyboard_check_pressed(vk_escape)) {
	instance_create_layer(0, 0, "layer_inst", obj_pause);
}

// 디버그
if (keyboard_check_pressed(vk_f5)) {
	game_restart();
}
