global.gameScore = 0;
global.gameSpeed = 1;
global.stringBallCount = 0;
global.mackerelCount = 0;

global.hpMax = 100;
global.hp = global.hpMax;
global.defense = 0;

enum Event {
	enemy,
	block,
	item,
};

enum EventGenTime {
	enemy = 180,
	block = 240,
	item = 660,
};

// Draw
var hpbarSpriteWidth = sprite_get_width(spr_hpbar);
hpbarWidth = hpbarSpriteWidth * (global.hp / global.hpMax);

//alarm[Event.enemy] = EventGenTime.enemy * global.gameSpeed;
alarm[Event.block] = EventGenTime.block * global.gameSpeed;
//alarm[Event.item] = EventGenTime.item * global.gameSpeed;
