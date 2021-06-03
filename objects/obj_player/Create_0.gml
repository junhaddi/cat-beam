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
beamRange = GAME_WIDTH - 400;
beamThicknessMax = 24;
beamThickness = 0;

// 피격
isDamaged = false;
damagedTimeMax = room_speed * 1;
