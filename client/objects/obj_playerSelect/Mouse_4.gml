if (global.gameState == GameState.PlayerSelect) {
	global.playerKind = kind;
	global.hpMax = global.playersStatus[| kind][? "hpMax"];
	global.hp = global.hpMax;
	global.defence = global.playersStatus[| kind][? "defence"];
	global.gameSpeed = global.playersStatus[| kind][? "speed"];
	global.beamDamage = global.playersStatus[| kind][? "beamDamage"];
	global.beamRangeMax = global.playersStatus[| kind][? "beamRangeMax"];
	
	global.gameState = GameState.InGame;
	
	with (obj_player) {
		isDead = false;
		path_start(path_playerStart, 24, path_action_stop, true);
	}
}
