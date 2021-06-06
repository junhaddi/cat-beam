/// @description 블록 생성

var block;
if (irandom(4) == 0) {
	block = obj_doubleFlowerpot;
} else {
	block = obj_flowerpot;
}
instance_create_layer(GAME_WIDTH, GAME_HEIGHT - 100, "layer_block", block);
