tag = Tag.Player;

isDead = false;
state = "run";

// 이동
vspdMax = 18;
vspd = 0;
grav = 0.8;
jumpPower = -18;

jumpCountMax = 2;
jumpCount = jumpCountMax;
isGround = false;

// 공격
isBeam = false;
isBeamStraight = false;
beamOffsetX = 30;
beamOffsetY = 12;
beamRange = 0;
beamThicknessMax = 24;
beamThickness = 0;
beamColor = c_yellow;

// 피격
isDamaged = false;
damagedTimeMax = GAME_FPS * 1;
