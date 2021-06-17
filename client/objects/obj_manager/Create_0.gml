// 인게임 정보
global.gameState = GameState.MainMenu;

global.isFever = false;

global.playerKind = 0;
global.hpMax = 0;
global.hp = 0;
global.defence = 0;
global.gameSpeed = 0;
global._gameSpeed = 0;
global.beamDamage = 0;
global.beamRangeMax = 0;

global.petHp = 0;

global.gameScore = 0;
global.stringBallCount = 0;
global.mackerelCount = 0;

// Parallax 배경 기본속도
groundSpeed = -14;
citySpeed = -8;
skySpeed = -4;

// 웨이브
currentWave = -1;
waveIndex = 0;
waveTimerMax = 0;
waveTimer = 0;

// Draw
hpbarSpriteWidth = sprite_get_width(spr_hpbar);
hpbarSpriteHeight = sprite_get_height(spr_hpbar);
hpbarWidth = 0;
