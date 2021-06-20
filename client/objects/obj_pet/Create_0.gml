event_inherited();

isRescue = false;
petKind = irandom(2);

isDead = false;
state = "run";

// 이동
vspdMax = 24;
vspd = 0;
grav = 1.2;
jumpPower = -24;

jumpCountMax = 2;
jumpCount = jumpCountMax;
isGround = false;

// 공격
isBeam = false;
isBeamStraight = false;
beamOffsetX = 15;
beamOffsetY = 6;
beamRangeMax = GAME_WIDTH - 800;
beamRange = 0;
beamThicknessMax = 12;
beamThickness = 0;
beamColor = choose(c_red, c_green, c_blue);
