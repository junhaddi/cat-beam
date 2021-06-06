function scr_init() {
	#macro GAME_FPS 60
	#macro GAME_WIDTH 1280
	#macro GAME_HEIGHT 720
	#macro GAME_CENTER 640
	#macro GAME_MIDDLE 360
	
	enum GameState {
		Menu,
		Tutorial,
		InGame,
		GameOver,
	};
	
	enum ManagerAlarm {
		Enemy,
		Block,
		Item,
	};
	
	enum PlayerAlarm {
		Damaged,
	};
	
	enum ManagerEventTime {
		Enemy = 160,
		Block = 280,
		Item = 420,
	};

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

	// 게임 기본설정
	draw_set_font(font_general);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top)
	
	audio_play_sound(bgm_game1, 10, true);
	
	room_goto_next();
}
