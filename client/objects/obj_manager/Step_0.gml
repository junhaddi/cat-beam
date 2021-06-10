switch (global.gameState) {
	case GameState.MainMenu:
		#region MainMenu
		// Parallax 배경 속도설정
		layer_hspeed("bg_ground", groundSpeed);
		layer_hspeed("bg_city", citySpeed);
		layer_hspeed("bg_sky", skySpeed);
		
		// 게임시작
		if (keyboard_check_pressed(vk_anykey)) {
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
		global.hp -= 1 / GAME_FPS;
		
		if (global.hp > 0) {
			global.gameScore += 1;
			
			// Parallax 배경 속도설정
			layer_hspeed("bg_ground", groundSpeed * global.gameSpeed);
			layer_hspeed("bg_city", citySpeed * global.gameSpeed);
			layer_hspeed("bg_sky", skySpeed * global.gameSpeed);

			// 게임 일시정지
			if (keyboard_check_pressed(vk_escape)) {
				layer_hspeed("bg_ground", 0);
				layer_hspeed("bg_city", 0);
				layer_hspeed("bg_sky", 0);
				instance_create_layer(0, 0, "layer_inst", obj_pause);
			}

			// 이벤트 발생
			//if (alarm[ManagerAlarm.Enemy] == -1) {
			//	alarm[ManagerAlarm.Enemy] = ManagerEventTime.Enemy * global.gameSpeed;
			//}
			
			//if (alarm[ManagerAlarm.Block] == -1) {
			//	alarm[ManagerAlarm.Block] = ManagerEventTime.Block * global.gameSpeed;
			//}
			
			//if (alarm[ManagerAlarm.Item] == -1) {
			//	alarm[ManagerAlarm.Item] = ManagerEventTime.Item * global.gameSpeed;
			//}
			
			//if (alarm[ManagerAlarm.Item] == -1) {
			//	alarm[ManagerAlarm.Item] = ManagerEventTime.Item * global.gameSpeed;
			//}
			
			//if (!instance_exists(obj_pet)) {
			//	if (alarm[ManagerAlarm.Pet] == -1) {
			//		alarm[ManagerAlarm.Pet] = ManagerEventTime.Pet * global.gameSpeed;
			//	}
			//} else {
			//	alarm[ManagerAlarm.Pet] = 0;
			//}
			
			if (alarm[ManagerAlarm.Wave] == -1) {
				alarm[ManagerAlarm.Wave] = ManagerEventTime.Wave * global.gameSpeed;
			}

			if (currentWave != -1) {
				waveTimer++;
				if (waveTimer >= waveTimerMax) {
					if (waveIndex < ds_list_size(currentWave)) {
						// 펫은 게임에서 딱 하나만 존재해야함
						if (currentWave[| waveIndex].prop != obj_pet || !instance_exists(obj_pet)) {
							var _layer;
							var prop = instance_create_depth(GAME_WIDTH, GAME_HEIGHT - 100, 0, currentWave[| waveIndex].prop);
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
			
			alarm[ManagerAlarm.Enemy] = 0;
			alarm[ManagerAlarm.Block] = 0;
			alarm[ManagerAlarm.Item] = 0;
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
if (keyboard_check_pressed(vk_f5)) {
	room_restart();
}
	