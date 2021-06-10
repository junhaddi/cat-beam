/// @description 웨이브 생성

currentWave = global.waves[| irandom_range(0, ds_list_size(global.waves) - 1)];
