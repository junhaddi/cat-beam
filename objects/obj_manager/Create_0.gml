global.gameScore = 0;
global.gameSpeed = 1;
global.stringBallCount = 0;
global.mackerelCount = 0;

global.hpMax = 100;
global.hp = global.hpMax;
global.defense = 0;

enum ManagerAlarm {
	enemy,
	block,
	item,
};

enum ManagerEventTime {
	enemy = 160,
	block = 280,
	item = 420,
};

// Draw
var hpbarSpriteWidth = sprite_get_width(spr_hpbar);
hpbarWidth = hpbarSpriteWidth * (global.hp / global.hpMax);

alarm[ManagerAlarm.enemy] = ManagerEventTime.enemy * global.gameSpeed;
alarm[ManagerAlarm.block] = ManagerEventTime.block * global.gameSpeed;
alarm[ManagerAlarm.item] = ManagerEventTime.item * global.gameSpeed;
