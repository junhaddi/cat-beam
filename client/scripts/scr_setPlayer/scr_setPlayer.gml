function scr_setPlayer(kind) {
	global.playerKind = kind;
	
	global.hpMax = global.playersStatus[| global.playerKind][? "hpMax"];
	global.hp = global.hpMax;
	global.defence = global.playersStatus[| global.playerKind][? "defence"];
	global.gameSpeed = global.playersStatus[| global.playerKind][? "speed"];
	global.beamDamage = global.playersStatus[| global.playerKind][? "beamDamage"];
	global.beamRangeMax = global.playersStatus[| global.playerKind][? "beamRangeMax"];
	
	with (obj_player) {
		isDead = false;
		isBeamStraight = global.playersStatus[| global.playerKind][? "beamStraight"];
		path_start(path_playerStart, 24, path_action_stop, true);
	}
}
