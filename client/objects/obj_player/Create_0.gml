tag = Tag.Player;

isDead = false;

// 이동
vspdMax = 28;
vspd = 0;
grav = 1;
jumpPower = -20;

jumpCountMax = 2;
jumpCount = jumpCountMax;

// 공격
isBeam = false;
isBeamStraight = false;
beamOffsetX = 30;
beamOffsetY = 12;
beamRange = 0;
beamThicknessMax = 24;
beamThickness = 0;

// 피격
isDamaged = false;
damagedTimeMax = GAME_FPS * 1;
