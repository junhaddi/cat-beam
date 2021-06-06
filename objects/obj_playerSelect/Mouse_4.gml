global.hpMax = global.playersStatus[| kind][? "hpMax"];
global.hp = global.hpMax;
global.defense = global.playersStatus[| kind][? "defence"];
global.gameSpeed = global.playersStatus[| kind][? "speed"];
global.beamDamage = global.playersStatus[| kind][? "beamDamage"];
global.beamRangeMax = global.playersStatus[| kind][? "beamRangeMax"];
