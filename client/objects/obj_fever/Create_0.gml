isDead = false;

feverKind = irandom(2);

// 이동
vspdMax = random_range(14, 22);
vspd = 0;
grav = random_range(0.8, 1.2);
jumpPower = -vspdMax;

// 공격
isBeam = true;
beamOffsetX = 30;
beamOffsetY = 12;
beamRangeMax = GAME_WIDTH;
beamRange = 0;
beamThicknessMax = 12;
beamThickness = 0;
beamColor = choose(c_red, c_green, c_blue);
