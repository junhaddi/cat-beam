function scr_createProp(object) {
	var _layer;
	var prop = instance_create_depth(GAME_WIDTH, 620, 0, object);
	switch (prop.tag) {
		case Tag.Enemy:
			_layer = "layer_enemy";
			break;
		case Tag.Block:
			_layer = "layer_block";
			break;
		case Tag.Item:
			_layer = "layer_item";
			break;
		case Tag.Pet:
			_layer = "layer_inst";
			break;
	}
	prop.layer = layer_get_id(_layer);
	return prop;
}
