enum PlayerAlarm {
	Damaged,
}

isDead = false;

// 이동
vspd = 0;
grav = 1;
jumpPower = -18

jumpCountMax = 2;
jumpCount = jumpCountMax;

// 공격
isBeam = false;
beamOffsetX = 30;
beamOffsetY = 12;
beamRangeMax = GAME_WIDTH - 400;
beamRange = beamRangeMax;
beamThicknessMax = 24;
beamThickness = 0;

// 피격
isDamaged = false;
damagedTimeMax = room_speed * 1;
