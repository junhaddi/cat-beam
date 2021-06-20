function scr_createProp(object) {
	var _y, _layer;
	var prop = instance_create_depth(GAME_WIDTH, 0, 0, object);
	switch (prop.tag) {
		case Tag.Enemy:
			_y = 608;
			_layer = "layer_enemy";
			break;
		case Tag.Block:
			_y = 608;
			_layer = "layer_block";
			break;
		case Tag.Item:
			_y = 544;
			_layer = "layer_item";
			break;
		case Tag.Pet:
			_y = 544;
			_layer = "layer_inst";
			break;
	}
	prop.x = GAME_WIDTH + sprite_get_xoffset(prop.sprite_index);
	prop.y = _y;
	prop.layer = layer_get_id(_layer);
	return prop;
}
