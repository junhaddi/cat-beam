/// @description 적 생성

var enemy;
switch (irandom(9)) {
	case 0:
	case 1:
	case 2:
	case 3:
		enemy = obj_man;
		break;
	case 4:
	case 5:
	case 6:
	case 7:
		enemy = obj_woman;
		break;
	case 8:
	case 9:
		enemy = obj_hellchang;
		break;
}
instance_create_layer(GAME_WIDTH, GAME_HEIGHT - 100, "layer_enemy", enemy);

alarm[ManagerAlarm.Enemy] = ManagerEventTime.Enemy * global.gameSpeed;
