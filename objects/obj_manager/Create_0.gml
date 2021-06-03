#macro GAME_WIDTH 1280
#macro GAME_HEIGHT 720

global.hp = 4;
global.gameSpeed = 1;

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

//alarm[Event.enemy] = EventGenTime.enemy * global.gameSpeed;
alarm[Event.block] = EventGenTime.block * global.gameSpeed;
//alarm[Event.item] = EventGenTime.item * global.gameSpeed;
