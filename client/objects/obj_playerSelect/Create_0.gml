event_inherited();

isCanTap = false;
tapDelayTime = GAME_FPS * 0.5;
alarm[0] = tapDelayTime;

switch (kind) {
	case 0:
		sprite_index = spr_player1_run;
		break;
	case 1:
		sprite_index = spr_player2_run;
		break;
	case 2:
		sprite_index = spr_player3_run;
		break;
}
