function scr_createBubble(text, destroyTime) {
	var textBubble = instance_create_layer(0, 0, "layer_ui", obj_textBubble);
	textBubble.text = text;
	textBubble.alarm[0] = destroyTime;
	
	return textBubble;
}
