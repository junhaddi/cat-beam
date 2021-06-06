// 인게임 정보
global.gameState = GameState.Menu;

global.hpMax = 0;
global.hp = 0;
global.defense = 0;
global.gameSpeed = 0;
global.beamDamage = 0;
global.beamRangeMax = 0;

global.gameScore = 0;
global.stringBallCount = 0;
global.mackerelCount = 0;

// Draw
hpbarSpriteWidth = sprite_get_width(spr_hpbar);
hpbarSpriteHeight = sprite_get_height(spr_hpbar);
hpbarWidth = hpbarSpriteWidth * (global.hp / global.hpMax);
