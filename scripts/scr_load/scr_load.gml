function scr_load(fileName) {
	global.saveMap = ds_map_secure_load(fileName);
	global.gameHighScore = global.saveMap[? "highScore"];
}
