/// @description 웨이브 발생

if (currentWave == -1) {
	currentWave = global.waves[| irandom_range(0, ds_list_size(global.waves) - 1)];
	waveIndex = 0;
	waveTimerMax = GAME_FPS * 2;
	waveTimer = 0;
}
