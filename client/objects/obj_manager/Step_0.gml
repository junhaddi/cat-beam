switch (global.gameState) {
	case GameState.MainMenu:
		#region MainMenu
		// Parallax 배경 속도설정
		layer_hspeed("bg_ground", groundSpeed);
		layer_hspeed("bg_city", citySpeed);
		layer_hspeed("bg_sky", skySpeed);
		
		// 게임시작
		if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) {
			global.gameState = GameState.PlayerSelect;
		}
		#endregion
		break;
	case GameState.PlayerSelect:
		#region PlayerSelect
		// Parallax 배경 속도설정
		layer_hspeed("bg_ground", groundSpeed);
		layer_hspeed("bg_city", citySpeed);
		layer_hspeed("bg_sky", skySpeed);
		#endregion
		break;
	case GameState.Tutorial:
		#region Tutorial
		#endregion
		break;
	case GameState.InGame:
		#region InGame
		if (global.isFever) {
			global.gameSpeed = global._gameSpeed * 3;
		} else {
			global.hp -= 1 / GAME_FPS;
			global.gameSpeed += 1 / (GAME_FPS * 360);
			global._gameSpeed = global.gameSpeed;
		}
	
		if (global.hp > 0) {
			global.gameScore += 5;
			
			// Parallax 배경 속도설정
			layer_hspeed("bg_ground", groundSpeed * global.gameSpeed);
			layer_hspeed("bg_city", citySpeed * global.gameSpeed);
			layer_hspeed("bg_sky", skySpeed * global.gameSpeed);

			// 게임 일시정지
			if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace)) {
				layer_hspeed("bg_ground", 0);
				layer_hspeed("bg_city", 0);
				layer_hspeed("bg_sky", 0);
				instance_create_layer(0, 0, "layer_inst", obj_pause);
			}
			
			// 웨이브 발생
			if (alarm[ManagerAlarm.Wave] == -1) {
				alarm[ManagerAlarm.Wave] = GAME_FPS * 2;
			}

			if (currentWave != -1) {
				waveTimer++;
				if (waveTimer >= waveTimerMax) {
					if (waveIndex < ds_list_size(currentWave)) {
						// 펫은 게임에서 딱 하나만 존재해야함
						if (currentWave[| waveIndex].prop != obj_pet || !instance_exists(obj_pet)) {
							var _layer;
							var prop = instance_create_depth(GAME_WIDTH, 620, 0, currentWave[| waveIndex].prop);
							switch (prop.tag) {
								case Tag.Enemy:
									_layer = "layer_enemy";
									break;
								case Tag.Block:
									_layer = "layer_block";
									break;
								case Tag.Item:
									_layer = "layer_item";
									break;
								case Tag.Pet:
									_layer = "layer_inst";
									break;
							}
							prop.layer = layer_get_id(_layer);
						}
						waveTimerMax = currentWave[| waveIndex].time;
						waveIndex++;
					} else {
						currentWave = -1;
						waveIndex = 0;
						waveTimerMax = 0;
					}
					waveTimer = 0;
				}
			}
			
			// 피버타임
			if (global.mackerelCount >= 5) {
				global.isFever = true;
				global.mackerelCount = 0;
				alarm[ManagerAlarm.Fever] = GAME_FPS * 10;
				
				repeat(6) {
					instance_create_layer(random_range(obj_player.x - 200, obj_player.x + 200), 0, "layer_inst", obj_fever);
				}
			}
	
			// Draw
			hpbarWidth = scr_ease(hpbarWidth, hpbarSpriteWidth * (global.hp / global.hpMax));
		} else {
			// 플레이어 사망
			global.gameState = GameState.GameOver;

			// 신기록 달성
			if (global.gameScore > global.gameHighScore) {
				global.gameHighScore = global.gameScore;
				global.saveMap[? "highScore"] = global.gameHighScore;
				scr_save(SAVE_FILE);
			}
			
			currentWave = -1;
			waveIndex = 0;
			waveTimerMax = 0;
			waveTimer = 0;
			alarm[ManagerAlarm.Wave] = 0;
		}
		#endregion
		break;
	case GameState.GameOver:
		#region GameOver
		if (keyboard_check_pressed(ord("R"))) {
			global.gameState = GameState.PlayerSelect;
			global.gameScore = 0;
			global.stringBallCount = 0;
			global.mackerelCount = 0;
		}
		#endregion
		break;
}
		
// 디버그
if (keyboard_check_pressed(vk_f1)) {
	global.hp = global.hpMax;
}

if (keyboard_check_pressed(vk_f2)) {
	global.stringBallCount++;
}

if (keyboard_check_pressed(vk_f3)) {
	global.mackerelCount++;
}

if (keyboard_check_pressed(vk_f4)) {
	global.gameSpeed += 0.1;
}

if (keyboard_check_pressed(vk_f5)) {
	room_restart();
}

//if (keyboard_check_pressed(vk_left)) {
//	// 불러오기
//	http_get(SERVER_URL + "/leaderboards");
//}

//if (keyboard_check_pressed(vk_right)) {
//	// 저장(한글 입력시 버그) 바디파서 공부
//	var name = get_string("이름을 적어주세요", "Anonymous");
//	var query = "name=" + name + "&score=" + string(global.gameHighScore);
//	http_post_string(SERVER_URL + "/leaderboards?" + query, query);
//}
