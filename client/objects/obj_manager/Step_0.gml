switch (global.gameState) {
	case GameState.MainMenu:
		#region MainMenu
		// Parallax 배경 속도설정
		layer_hspeed("bg_ground", groundSpeed);
		layer_hspeed("bg_city", citySpeed);
		layer_hspeed("bg_cloud", skySpeed);
		
		// 게임시작
		if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_left)) {
			// TODO 튜토리얼 정보 값 저장
			//global.gameState = GameState.PlayerSelect;
			
			global.gameState = GameState.Tutorial;
			instance_create_layer(0, 0, "layer_inst", obj_tutorial);
			scr_setPlayer(0);
		}
		#endregion
		break;
	case GameState.Tutorial:
	case GameState.InGame:
		#region Tutorial, InGame
		// 터치(모바일) 입력
		global.isTouchs = [false, false, false];
		var touchs = [obj_jumpButton, obj_beamButton, obj_pauseButton];
		var fingerMax = 4;
		for (var i = 0; i < fingerMax; i++) {
			for (var j = 0; j < array_length(touchs); j++) {
				var button = touchs[j];
				if (device_mouse_check_button(i, mb_left)) {
					if (device_mouse_x(i) >= button.bbox_left && device_mouse_x(i) <= button.bbox_right &&
						device_mouse_y(i) >= button.bbox_top && device_mouse_y(i) <= button.bbox_bottom) {
						switch (button) {
							case obj_jumpButton:
								if (!button.isPressed) {
									global.isTouchs[Touch.Jump] = true;
								}
								break;
							case obj_beamButton:
								global.isTouchs[Touch.Beam] = true;
								break;
							case obj_pauseButton:
								global.isTouchs[Touch.Pause] = true;
								break;
						}
						button.isBoundary = true;
						button.isPressed = true;
					} else {
						button.isBoundary = false;
					}
				}
				
				if (device_mouse_check_button_released(i, mb_left)) {
					button.isBoundary = false;
					button.isPressed = false;
				}
			}
		}
		
		// 게임 일시정지
		if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace) || global.isTouchs[Touch.Pause]) {
			layer_hspeed("bg_ground", 0);
			layer_hspeed("bg_city", 0);
			layer_hspeed("bg_cloud", 0);
			instance_create_layer(0, 0, "layer_inst", obj_pause);
		}
				
		if (!global.isStop) {
			if (global.hp > 0) {
				layer_hspeed("bg_ground", groundSpeed * global.gameSpeed);
				layer_hspeed("bg_city", citySpeed * global.gameSpeed);
				layer_hspeed("bg_cloud", skySpeed * global.gameSpeed);
				
				if (global.gameState == GameState.InGame) {
					global.gameScore += 5;
				}

				if (global.isFever) {
					// 피버타임
					global.gameSpeed = global._gameSpeed * 3;
				} else {
					global.hp -= 1 / GAME_FPS;
					global.gameSpeed += 1 / (GAME_FPS * 360);
					global._gameSpeed = global.gameSpeed;
				}
				
				// 웨이브 발생
				if (alarm[ManagerAlarm.Wave] == -1 && !instance_exists(obj_tutorial)) {
					alarm[ManagerAlarm.Wave] = GAME_FPS * 2;
				}
			
				if (currentWave != -1) {
					waveTimer++;
					if (waveTimer >= waveTimerMax) {
						if (waveIndex < ds_list_size(currentWave)) {
							// 펫은 게임에서 딱 하나만 존재해야함
							if (currentWave[| waveIndex].prop != obj_pet || !instance_exists(obj_pet)) {
								var _layer;
								var prop = scr_createProp(currentWave[| waveIndex].prop);
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
		} else {
			layer_hspeed("bg_ground", 0);
			layer_hspeed("bg_city", 0);
			layer_hspeed("bg_cloud", 0);
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
