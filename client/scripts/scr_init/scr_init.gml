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
	};
	
	enum PlayerAlarm {
		Damaged,
	};
	
	enum ManagerEventTime {
		Wave = 120,
	};

	// 세이브파일 불러오기
	global.gameHighScore = 0;
	global.saveMap = ds_map_create();
	if (file_exists(SAVE_FILE)) {
		scr_load(SAVE_FILE);
	}

	// 플레이어별 정보 입력
	var player1 = ds_map_create();
	player1[? "hpMax"] = 100;
	player1[? "defence"] = 0;
	player1[? "speed"] = 1;
	player1[? "beamDamage"] = 1;
	player1[? "beamRangeMax"] = GAME_WIDTH - 400;

	var player2 = ds_map_create();
	player2[? "hpMax"] = 80;
	player2[? "defence"] = 0;
	player2[? "speed"] = 1.2;
	player2[? "beamDamage"] = 1.2;
	player2[? "beamRangeMax"] = GAME_WIDTH - 500;

	var player3 = ds_map_create();
	player3[? "hpMax"] = 120;
	player3[? "defence"] = 1;
	player3[? "speed"] = 0.8;
	player3[? "beamDamage"] = 1;
	player3[? "beamRangeMax"] = GAME_WIDTH - 600;

	// 플레이어 정보 구조체화
	global.playersStatus = ds_list_create();
	
	ds_list_add(global.playersStatus, player1);
	ds_list_add(global.playersStatus, player2);
	ds_list_add(global.playersStatus, player3);
	
	ds_list_mark_as_map(global.playersStatus, 0);
	ds_list_mark_as_map(global.playersStatus, 1);
	ds_list_mark_as_map(global.playersStatus, 2);

	// 웨이브 정보 입력
	#region wave1
	var wave1 = ds_list_create();
	ds_list_add(wave1, {
		prop: obj_block3,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave1, {
		prop: obj_block3,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave1, {
		prop: obj_block4,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave1, {
		prop: obj_block1,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave1, {
		prop: obj_block2,
		time: 0,
	});
	#endregion	
	#region wave2
	var wave2 = ds_list_create();
	ds_list_add(wave2, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave2, {
		prop: obj_block1,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave2, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave2, {
		prop: obj_block2,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave2, {
		prop: obj_block4,
		time: 0,
	});
	#endregion	
	#region wave3
	var wave3 = ds_list_create();
	ds_list_add(wave3, {
		prop: obj_block1,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave3, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave3, {
		prop: obj_block2,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave3, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave3, {
		prop: obj_block1,
		time: 0,
	});
	#endregion	
	#region wave4
	var wave4 = ds_list_create();
	ds_list_add(wave4, {
		prop: obj_block3,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave4, {
		prop: obj_block4,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave4, {
		prop: obj_block3,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave4, {
		prop: obj_block4,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave4, {
		prop: obj_block3,
		time: 0,
	});
	#endregion	
	#region wave5
	var wave5 = ds_list_create();
	ds_list_add(wave5, {
		prop: obj_block3,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave5, {
		prop: obj_block4,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave5, {
		prop: obj_block1,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave5, {
		prop: obj_block4,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave5, {
		prop: obj_block2,
		time: 0,
	});
	#endregion	
	#region wave6
	var wave6 = ds_list_create();
	ds_list_add(wave6, {
		prop: obj_man,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave6, {
		prop: obj_block3,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave6, {
		prop: obj_man,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave6, {
		prop: obj_block3,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave6, {
		prop: obj_hellchang,
		time: 0,
	});
	#endregion	
	#region wave7
	var wave7 = ds_list_create();
	ds_list_add(wave7, {
		prop: obj_block1,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave7, {
		prop: obj_woman,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave7, {
		prop: obj_woman,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave7, {
		prop: obj_hellchang,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave7, {
		prop: obj_block2,
		time: 0,
	});
	#endregion	
	#region wave8
	var wave8 = ds_list_create();
	ds_list_add(wave8, {
		prop: obj_block1,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave8, {
		prop: obj_hellchang,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave8, {
		prop: obj_block4,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave8, {
		prop: obj_man,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave8, {
		prop: obj_man,
		time: 0,
	});
	#endregion	
	#region wave9
	var wave9 = ds_list_create();
	ds_list_add(wave9, {
		prop: obj_woman,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave9, {
		prop: obj_man,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave9, {
		prop: obj_woman,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave9, {
		prop: obj_man,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave9, {
		prop: obj_hellchang,
		time: 0,
	});
	#endregion	
	#region wave10
	var wave10 = ds_list_create();
	ds_list_add(wave10, {
		prop: obj_woman,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave10, {
		prop: obj_woman,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave10, {
		prop: obj_woman,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave10, {
		prop: obj_man,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave10, {
		prop: obj_man,
		time: 0,
	});
	#endregion	
	#region wave11
	var wave11 = ds_list_create();
	ds_list_add(wave11, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave11, {
		prop: obj_block4,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave11, {
		prop: obj_stringBall,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave11, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave11, {
		prop: obj_block2,
		time: 0,
	});
	#endregion	
	#region wave12
	var wave12 = ds_list_create();
	ds_list_add(wave12, {
		prop: obj_block1,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave12, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave12, {
		prop: obj_block2,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave12, {
		prop: obj_stringBall,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave12, {
		prop: obj_block1,
		time: 0,
	});
	#endregion	
	#region wave13
	var wave13 = ds_list_create();
	ds_list_add(wave13, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave13, {
		prop: obj_block4,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave13, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave13, {
		prop: obj_block4,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave13, {
		prop: obj_ciao,
		time: 0,
	});
	#endregion	
	#region wave14
	var wave14 = ds_list_create();
	ds_list_add(wave14, {
		prop: obj_block2,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave14, {
		prop: obj_block4,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave14, {
		prop: obj_ciao,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave14, {
		prop: obj_block4,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave14, {
		prop: obj_block1,
		time: 0,
	});
	#endregion	
	#region wave15
	var wave15 = ds_list_create();
	ds_list_add(wave15, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave15, {
		prop: obj_block4,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave15, {
		prop: obj_mackerel,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave15, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave15, {
		prop: obj_block1,
		time: 0,
	});
	#endregion	
	#region wave16
	var wave16 = ds_list_create();
	ds_list_add(wave16, {
		prop: obj_block4,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave16, {
		prop: obj_block4,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave16, {
		prop: obj_block2,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave16, {
		prop: obj_mackerel,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave16, {
		prop: obj_block1,
		time: 0,
	});
	#endregion	
	#region wave17
	var wave17 = ds_list_create();
	ds_list_add(wave17, {
		prop: obj_block3,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave17, {
		prop: obj_block4,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave17, {
		prop: obj_man,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave17, {
		prop: obj_stringBall,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave17, {
		prop: obj_hellchang,
		time: 0,
	});
	#endregion	
	#region wave18
	var wave18 = ds_list_create();
	ds_list_add(wave18, {
		prop: obj_woman,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave18, {
		prop: obj_block2,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave18, {
		prop: obj_man,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave18, {
		prop: obj_hellchang,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave18, {
		prop: obj_ciao,
		time: 0,
	});
	#endregion	
	#region wave19
	var wave19 = ds_list_create();
	ds_list_add(wave19, {
		prop: obj_block2,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave19, {
		prop: obj_man,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave19, {
		prop: obj_mackerel,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave19, {
		prop: obj_hellchang,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave19, {
		prop: obj_block4,
		time: 0,
	});
	#endregion	
	#region wave20
	var wave20 = ds_list_create();
	ds_list_add(wave20, {
		prop: obj_block2,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave20, {
		prop: obj_block1,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave20, {
		prop: obj_man,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave20, {
		prop: obj_man,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave20, {
		prop: obj_mackerel,
		time: 0,
	});
	#endregion	
	#region wave21
	var wave21 = ds_list_create();
	ds_list_add(wave21, {
		prop: obj_woman,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave21, {
		prop: obj_woman,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave21, {
		prop: obj_man,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave21, {
		prop: obj_hellchang,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave21, {
		prop: obj_pet,
		time: 0,
	});
	#endregion	
	#region wave22
	var wave22 = ds_list_create();
	ds_list_add(wave22, {
		prop: obj_pet,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave22, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave22, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave22, {
		prop: obj_hellchang,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave22, {
		prop: obj_hellchang,
		time: 0,
	});
	#endregion	
	#region wave23
	var wave23 = ds_list_create();
	ds_list_add(wave23, {
		prop: obj_block3,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave23, {
		prop: obj_block4,
		time: GAME_FPS * 1.6,
	});
	ds_list_add(wave23, {
		prop: obj_block1,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave23, {
		prop: obj_pet,
		time: GAME_FPS * 1.3,
	});
	ds_list_add(wave23, {
		prop: obj_man,
		time: GAME_FPS * 1.3,
	});
	#endregion	
	
	// 웨이브 정보 구조체화
	global.waves = ds_list_create();
	
	ds_list_add(global.waves, wave1);
	ds_list_add(global.waves, wave2);
	ds_list_add(global.waves, wave3);
	ds_list_add(global.waves, wave4);
	ds_list_add(global.waves, wave5);
	ds_list_add(global.waves, wave6);
	ds_list_add(global.waves, wave7);
	ds_list_add(global.waves, wave8);
	ds_list_add(global.waves, wave9);
	ds_list_add(global.waves, wave10);
	ds_list_add(global.waves, wave11);
	ds_list_add(global.waves, wave12);
	ds_list_add(global.waves, wave13);
	ds_list_add(global.waves, wave14);
	ds_list_add(global.waves, wave15);
	ds_list_add(global.waves, wave16);
	ds_list_add(global.waves, wave17);
	ds_list_add(global.waves, wave18);
	ds_list_add(global.waves, wave19);
	ds_list_add(global.waves, wave20);
	ds_list_add(global.waves, wave21);
	ds_list_add(global.waves, wave22);
	ds_list_add(global.waves, wave23);

	ds_list_mark_as_list(global.waves, 0);
	ds_list_mark_as_list(global.waves, 1);
	ds_list_mark_as_list(global.waves, 2);
	ds_list_mark_as_list(global.waves, 3);
	ds_list_mark_as_list(global.waves, 4);
	ds_list_mark_as_list(global.waves, 5);
	ds_list_mark_as_list(global.waves, 6);
	ds_list_mark_as_list(global.waves, 7);
	ds_list_mark_as_list(global.waves, 8);
	ds_list_mark_as_list(global.waves, 9);
	ds_list_mark_as_list(global.waves, 10);
	ds_list_mark_as_list(global.waves, 11);
	ds_list_mark_as_list(global.waves, 12);
	ds_list_mark_as_list(global.waves, 13);
	ds_list_mark_as_list(global.waves, 14);
	ds_list_mark_as_list(global.waves, 15);
	ds_list_mark_as_list(global.waves, 16);
	ds_list_mark_as_list(global.waves, 17);
	ds_list_mark_as_list(global.waves, 18);
	ds_list_mark_as_list(global.waves, 19);
	ds_list_mark_as_list(global.waves, 20);
	ds_list_mark_as_list(global.waves, 21);
	ds_list_mark_as_list(global.waves, 22);

	// 게임 기본설정
	draw_set_font(font_general);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top)
	
	// 배경음악 재생
	//audio_play_sound(bgm_game1, 10, true);
	
	room_goto_next();
}
