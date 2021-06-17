try {
	var json = async_load[? "result"];
	var map = json_decode(json);
	var arr = ds_map_values_to_array(map);
	
	for (var i = 0; i < array_length(arr); i++) {
		show_debug_message(arr[i][? "date"]);
		show_debug_message(arr[i][? "name"]);
		show_debug_message(arr[i][? "score"]);
	}
	
	ds_map_destroy(map);
} catch(error) {
	// 인터넷이 연결되어 있지 않음
	show_debug_message(error.message);
}
