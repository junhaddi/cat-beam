/// @description 아이템 생성

var item;
switch (irandom(9)) {
	case 0:
	case 1:
		item = obj_ciao;
		break;
	case 2:
	case 3:
	case 4:
	case 5:
		item = obj_stringBall;
		break;
	case 6:
	case 7:
	case 8:
	case 9:
		item = obj_mackerel;
		break;
}
instance_create_layer(GAME_WIDTH, GAME_HEIGHT - 100, "layer_item", item);
