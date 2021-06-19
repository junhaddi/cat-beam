function scr_init() {
	#macro SERVER_URL "http://localhost:30605"
	#macro SAVE_FILE "data.sav"
	#macro GAME_FPS 60
	#macro GAME_WIDTH 1280
	#macro GAME_HEIGHT 720
	#macro GAME_CENTER 640
	#macro GAME_MIDDLE 360
	
	enum Tag {
		Player,
		Enemy,
		Block,
		Item,
		Pet,
	}
	
	enum GameState {
		MainMenu,
		PlayerSelect,
		Tutorial,
		InGame,
		GameOver,
	};
	
	enum ManagerAlarm {
		Wave,
		Fever,
	};
	
	enum PlayerAlarm {
		Damaged,
	};

	// 세이브파일 불러오기
	global.gameHighScore = 0;
	global.saveMap = ds_map_create();
	if (file_exists(SAVE_FILE)) {
		scr_load(SAVE_FILE);
	}

	// 플레이어별 정보 입력
	var player1 = ds_map_create();
	player1[? "hpMax"] = 200;
	player1[? "defence"] = 2;
	player1[? "speed"] = 1;
	player1[? "beamDamage"] = 1;
	player1[? "beamRangeMax"] = GAME_WIDTH - 500;
	player1[? "beamStraight"] = false;

	var player2 = ds_map_create();
	player2[? "hpMax"] = 160;
	player2[? "defence"] = 0;
	player2[? "speed"] = 1.2;
	player2[? "beamDamage"] = 0.8;
	player2[? "beamRangeMax"] = GAME_WIDTH;
	player2[? "beamStraight"] = true;

	var player3 = ds_map_create();
	player3[? "hpMax"] = 240;
	player3[? "defence"] = 4;
	player3[? "speed"] = 0.8;
	player3[? "beamDamage"] = 1;
	player3[? "beamRangeMax"] = GAME_WIDTH - 600;
	player3[? "beamStraight"] = false;

	// 플레이어 정보 구조체화
	global.playersStatus = ds_list_create();
	
	ds_list_add(global.playersStatus, player1);
	ds_list_add(global.playersStatus, player2);
	ds_list_add(global.playersStatus, player3);
	
	ds_list_mark_as_map(global.playersStatus, 0);
	ds_list_mark_as_map(global.playersStatus, 1);
	ds_list_mark_as_map(global.playersStatus, 2);

	// 웨이브 정보 입력
	global.waves = ds_list_create();
	var space1 = 1.2;
	var space2 = 1.6;
	var space3 = 1.4;
	
	#region wave0
	global.waves[| 0] = ds_list_create();
	ds_list_add(global.waves[| 0], {
		prop: obj_block3,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 0], {
		prop: obj_block3,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 0], {
		prop: obj_block4,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 0], {
		prop: obj_block1,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 0], {
		prop: obj_block2,
		time: 0,
	});
	#endregion	
	#region wave1
	global.waves[| 1] = ds_list_create();
	ds_list_add(global.waves[| 1], {
		prop: obj_block3,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 1], {
		prop: obj_block1,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 1], {
		prop: obj_block3,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 1], {
		prop: obj_block2,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 1], {
		prop: obj_block4,
		time: 0,
	});
	#endregion	
	#region wave2
	global.waves[| 2] = ds_list_create();
	ds_list_add(global.waves[| 2], {
		prop: obj_block1,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 2], {
		prop: obj_block3,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 2], {
		prop: obj_block2,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 2], {
		prop: obj_block3,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 2], {
		prop: obj_block1,
		time: 0,
	});
	#endregion	
	#region wave3
	global.waves[| 3] = ds_list_create();
	ds_list_add(global.waves[| 3], {
		prop: obj_block3,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 3], {
		prop: obj_block4,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 3], {
		prop: obj_block3,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 3], {
		prop: obj_block4,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 3], {
		prop: obj_block3,
		time: 0,
	});
	#endregion	
	#region wave4
	global.waves[| 4] = ds_list_create();
	ds_list_add(global.waves[| 4], {
		prop: obj_block3,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 4], {
		prop: obj_block4,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 4], {
		prop: obj_block1,
		time: GAME_FPS * space2,
	});
	ds_list_add(global.waves[| 4], {
		prop: obj_block4,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 4], {
		prop: obj_block2,
		time: 0,
	});
	#endregion	
	#region wave5
	global.waves[| 5] = ds_list_create();
	ds_list_add(global.waves[| 5], {
		prop: obj_man,
		time: GAME_FPS * space2,
	});
	ds_list_add(global.waves[| 5], {
		prop: obj_block3,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 5], {
		prop: obj_man,
		time: GAME_FPS * space2,
	});
	ds_list_add(global.waves[| 5], {
		prop: obj_block3,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 5], {
		prop: obj_hellchang,
		time: 0,
	});
	#endregion	
	#region wave6
	global.waves[| 6] = ds_list_create();
	ds_list_add(global.waves[| 6], {
		prop: obj_block1,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 6], {
		prop: obj_woman,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 6], {
		prop: obj_woman,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 6], {
		prop: obj_hellchang,
		time: GAME_FPS * space2,
	});
	ds_list_add(global.waves[| 6], {
		prop: obj_block2,
		time: 0,
	});
	#endregion	
	#region wave7
	global.waves[| 7] = ds_list_create();
	ds_list_add(global.waves[| 7], {
		prop: obj_block1,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 7], {
		prop: obj_hellchang,
		time: GAME_FPS * space2,
	});
	ds_list_add(global.waves[| 7], {
		prop: obj_block4,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 7], {
		prop: obj_man,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 7], {
		prop: obj_man,
		time: 0,
	});
	#endregion	
	#region wave8
	global.waves[| 8] = ds_list_create();
	ds_list_add(global.waves[| 8], {
		prop: obj_woman,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 8], {
		prop: obj_man,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 8], {
		prop: obj_woman,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 8], {
		prop: obj_man,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 8], {
		prop: obj_hellchang,
		time: 0,
	});
	#endregion	
	#region wave9
	global.waves[| 9] = ds_list_create();
	ds_list_add(global.waves[| 9], {
		prop: obj_woman,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 9], {
		prop: obj_woman,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 9], {
		prop: obj_woman,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 9], {
		prop: obj_man,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 9], {
		prop: obj_man,
		time: 0,
	});
	#endregion	
	#region wave10
	global.waves[| 10] = ds_list_create();
	ds_list_add(global.waves[| 10], {
		prop: obj_block3,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 10], {
		prop: obj_block4,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 10], {
		prop: obj_stringBall,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 10], {
		prop: obj_block3,
		time: GAME_FPS * space2,
	});
	ds_list_add(global.waves[| 10], {
		prop: obj_block2,
		time: 0,
	});
	#endregion	
	#region wave11
	global.waves[| 11] = ds_list_create();
	ds_list_add(global.waves[| 11], {
		prop: obj_block1,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 11], {
		prop: obj_block3,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 11], {
		prop: obj_block2,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 11], {
		prop: obj_stringBall,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 11], {
		prop: obj_block1,
		time: 0,
	});
	#endregion	
	#region wave12
	global.waves[| 12] = ds_list_create();
	ds_list_add(global.waves[| 12], {
		prop: obj_block3,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 12], {
		prop: obj_block4,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 12], {
		prop: obj_block3,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 12], {
		prop: obj_block4,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 12], {
		prop: obj_ciao,
		time: 0,
	});
	#endregion	
	#region wave13
	global.waves[| 13] = ds_list_create();
	ds_list_add(global.waves[| 13], {
		prop: obj_block2,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 13], {
		prop: obj_block4,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 13], {
		prop: obj_ciao,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 13], {
		prop: obj_block4,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 13], {
		prop: obj_block1,
		time: 0,
	});
	#endregion	
	#region wave14
	global.waves[| 14] = ds_list_create();
	ds_list_add(global.waves[| 14], {
		prop: obj_block3,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 14], {
		prop: obj_block4,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 14], {
		prop: obj_mackerel,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 14], {
		prop: obj_block3,
		time: GAME_FPS * space2,
	});
	ds_list_add(global.waves[| 14], {
		prop: obj_block1,
		time: 0,
	});
	#endregion	
	#region wave15
	global.waves[| 15] = ds_list_create();
	ds_list_add(global.waves[| 15], {
		prop: obj_block4,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 15], {
		prop: obj_block4,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 15], {
		prop: obj_block2,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 15], {
		prop: obj_mackerel,
		time: GAME_FPS * space2,
	});
	ds_list_add(global.waves[| 15], {
		prop: obj_block1,
		time: 0,
	});
	#endregion	
	#region wave16
	global.waves[| 16] = ds_list_create();
	ds_list_add(global.waves[| 16], {
		prop: obj_block3,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 16], {
		prop: obj_block4,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 16], {
		prop: obj_man,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 16], {
		prop: obj_stringBall,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 16], {
		prop: obj_hellchang,
		time: 0,
	});
	#endregion	
	#region wave17
	global.waves[| 17] = ds_list_create();
	ds_list_add(global.waves[| 17], {
		prop: obj_woman,
		time: GAME_FPS * space2,
	});
	ds_list_add(global.waves[| 17], {
		prop: obj_block2,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 17], {
		prop: obj_man,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 17], {
		prop: obj_hellchang,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 17], {
		prop: obj_ciao,
		time: 0,
	});
	#endregion	
	#region wave18
	global.waves[| 18] = ds_list_create();
	ds_list_add(global.waves[| 18], {
		prop: obj_block2,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 18], {
		prop: obj_man,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 18], {
		prop: obj_mackerel,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 18], {
		prop: obj_hellchang,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 18], {
		prop: obj_block4,
		time: 0,
	});
	#endregion	
	#region wave19
	global.waves[| 19] = ds_list_create();
	ds_list_add(global.waves[| 19], {
		prop: obj_block2,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 19], {
		prop: obj_block1,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 19], {
		prop: obj_man,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 19], {
		prop: obj_man,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 19], {
		prop: obj_mackerel,
		time: 0,
	});
	#endregion	
	#region wave20
	global.waves[| 20] = ds_list_create();
	ds_list_add(global.waves[| 20], {
		prop: obj_woman,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 20], {
		prop: obj_woman,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 20], {
		prop: obj_man,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 20], {
		prop: obj_hellchang,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 20], {
		prop: obj_pet,
		time: 0,
	});
	#endregion	
	#region wave21
	global.waves[| 21] = ds_list_create();
	ds_list_add(global.waves[| 21], {
		prop: obj_pet,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 21], {
		prop: obj_block3,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 21], {
		prop: obj_block3,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 21], {
		prop: obj_hellchang,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 21], {
		prop: obj_hellchang,
		time: 0,
	});
	#endregion	
	#region wave22
	global.waves[| 22] = ds_list_create();
	ds_list_add(global.waves[| 22], {
		prop: obj_block3,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 22], {
		prop: obj_block4,
		time: GAME_FPS * space1,
	});
	ds_list_add(global.waves[| 22], {
		prop: obj_block1,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 22], {
		prop: obj_pet,
		time: GAME_FPS * space3,
	});
	ds_list_add(global.waves[| 22], {
		prop: obj_man,
		time: 0,
	});
	#endregion	
	
	// 웨이브 정보 구조체화
	for (var i = 0; i < ds_list_size(global.waves); i++) {
		ds_list_mark_as_list(global.waves, i);
	}

	// 게임 기본설정
	device_mouse_dbclick_enable(false);
	
	draw_set_font(font_general);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top)
	
	// 배경음악 재생
	//audio_play_sound(bgm_game1, 10, true);
	
	room_goto_next();
}
