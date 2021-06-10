event_inherited();

isRescue = false;
petKind = 0;

isDead = false;

// 이동
vspdMax = 24;
vspd = 0;
grav = 1;
jumpPower = -24;

jumpCountMax = 2;
jumpCount = jumpCountMax;

// 공격
isBeam = false;
isBeamStraight = false;
beamOffsetX = 80;
beamOffsetY = -32;
beamRangeMax = GAME_WIDTH - 800;
beamRange = 0;
beamThicknessMax = 12;
beamThickness = 0;
