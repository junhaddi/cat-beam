switch (global.gameState) {
	case GameState.MainMenu:
		#region MainMenu
		// Parallax 배경 속도설정
		layer_hspeed("bg_ground", groundSpeed);
		layer_hspeed("bg_city", citySpeed);
		layer_hspeed("bg_cloud", skySpeed);
		
		// 게임시작
		if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_left)) {
			if (global.isTutorialDone) {
				global.gameState = GameState.PlayerSelect;
				global.isInputsEnabled = [true, true, true];
			} else {
				global.gameState = GameState.Tutorial;
				global.isInputsEnabled = [false, false, true];
				instance_create_layer(0, 0, "layer_above", obj_tutorial);
				scr_setPlayer(0);
			}
		}
		#endregion
		break;
	case GameState.Tutorial:
	case GameState.InGame:
		#region Tutorial, InGame
		scr_input();
		
		if (!global.isStop) {
			if (global.hp > 0) {
				layer_hspeed("bg_ground", groundSpeed * global.gameSpeed);
				layer_hspeed("bg_city", citySpeed * global.gameSpeed);
				layer_hspeed("bg_cloud", skySpeed * global.gameSpeed);

				if (global.isFever) {
					// 피버타임
					global.gameSpeed = global._gameSpeed * 3;
				} else {
					global.hp -= 1 / GAME_FPS;
					global.gameSpeed += 1 / (GAME_FPS * 360);
					global._gameSpeed = global.gameSpeed;
				}
				
				if (global.gameState == GameState.InGame) {
					global.gameScore += 5;

					// 웨이브 발생
					if (alarm[ManagerAlarm.Wave] == -1) {
						alarm[ManagerAlarm.Wave] = GAME_FPS * 2;
					}
				}
			
				if (currentWave != -1) {
					waveTimer++;
					if (waveTimer >= waveTimerMax) {
						if (waveIndex < ds_list_size(currentWave)) {
							// 펫은 게임에서 딱 하나만 존재해야함
							if (currentWave[| waveIndex].prop != obj_pet || !instance_exists(obj_pet)) {
								scr_createProp(currentWave[| waveIndex].prop);
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
						instance_create_layer(random_range(obj_player.x - 200, obj_player.x + 200), 0, "layer_player", obj_fever);
					}
				}
			
				// Draw
				hpbarWidth = scr_ease(hpbarWidth, hpbarSpriteWidth * (global.hp / global.hpMax));
			} else {
				// 플레이어 사망
				global.gameState = GameState.GameOver;
				
				isCanGameOver = false;
				alarm[ManagerAlarm.GameOver] = gameOverDelayTime;
				
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
		} else {
			layer_hspeed("bg_ground", 0);
			layer_hspeed("bg_city", 0);
			layer_hspeed("bg_cloud", 0);
		}
		
		// 게임 일시정지
		if (global.isInputs[Input.Pause]) {
			layer_hspeed("bg_ground", 0);
			layer_hspeed("bg_city", 0);
			layer_hspeed("bg_cloud", 0);
			instance_create_layer(0, 0, "layer_above", obj_pause);
		}
		#endregion
		break;
	case GameState.GameOver:
		#region GameOver
		if (isCanGameOver && (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_left))) {
			global.gameState = GameState.PlayerSelect;
			global.gameScore = 0;
			global.stringBallCount = 0;
			global.mackerelCount = 0;
		}
		#endregion
		break;
}
		
#region 개발자 모드
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

if (keyboard_check_pressed(vk_f6)) {
	global.platform = global.platform == Platform.PC ? Platform.Mobile : Platform.PC;
}

if (keyboard_check_pressed(vk_f7)) {
	global.saveMap[? "tutorialDone"] = false;
	scr_save(SAVE_FILE);
}

if (keyboard_check_pressed(vk_f8)) {
	scr_createProp(obj_pet);
}

// TODO 리더보드
//if (keyboard_check_pressed(vk_f11)) {
//	// 불러오기
//	http_get(SERVER_URL + "/leaderboards");
//}

//if (keyboard_check_pressed(vk_f12)) {
//	// 저장(한글 입력시 버그) 바디파서 공부
//	var name = get_string("이름을 적어주세요", "Anonymous");
//	var query = "name=" + name + "&score=" + string(global.gameHighScore);
//	http_post_string(SERVER_URL + "/leaderboards?" + query, query);
//}
#endregion
